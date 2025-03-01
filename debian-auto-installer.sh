#!/bin/bash
confirm_action() {
  local message="$1"
  read -p "$message (y/n): " confirm
  if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    return 0
  else
    echo "Operation canceled."
    return 1
  fi
}

directory_is_valid() {
  # Check if the directory is valid
  if [[ -d "$1" && ! "$1" == *_archive* && ! "$1" == .git ]]; then
    return 0
  else
    return 1
  fi
}

check_docker() {
  #Check if a docker is installed, if not install it
  if command -v docker &>/dev/null; then
    echo "  [OK] - Docker is installed."
  else
    echo "  [WARN] - Docker is not installed."
    if [[ "$1" != "quiet" ]]; then
      install_docker 
    else
      if confirm_action "Do you want to INSTALL docker?"; then
        install_docker
      fi
    fi
  fi
}

install_docker(){
  for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
  
  sudo apt update && sudo apt install apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common \
  docker-compose -y &>/dev/null

  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh

  sudo groupadd docker
  sudo usermod -aG docker $USER
  newgrp docker

  clear
  echo '  [DONE] Docker Installed'
}

check_docker_compose() {
  #Check if a docker is installed, if not install it
  if command -v docker compose &>/dev/null; then
    echo "  [OK] - docker composed is installed."
  else
     if [[ "$1" != "quiet" ]]; then
      install_docker_compose 
    else
      if confirm_action "Do you want to INSTALL docker?"; then
        install_docker_compose
      fi
    fi
  fi
}

install_docker_compose(){
    if confirm_action "Are you sure you want to INSTALL docker?"; then
      sudo apt install docker-compose -y  &>/dev/null
      echo '[DONE] Docker Compose Installed'
    fi
}

check_docker_network() {
  # Function to check if a Docker network exists, if not create it
  local network_name="$1"

  if docker network inspect "$network_name" &>/dev/null; then
    echo "  [OK] - Docker network '$network_name' exists."
  else
    echo "  Docker network '$network_name' does not exist."
    docker network create $network_name &>/dev/null
    echo "  Docker network '$network_name' created."
  fi
}

check_hsds-cli_version() {
  # Function to check the hsds-cli version
  # If the version is not the latest, update it

  local latest_version=$(curl -s https://api.github.com/repos/vshxp/home-server-docker-services/releases/latest | grep tag_name | cut -d '"' -f 4)
  local current_version=$(hsds-cli version)

  if [[ "$latest_version" < "$current_version" ]]; then
    echo "New version available: $latest_version."
  else
    echo "hsds-cli is the latest version."
  fi
}

pull_docker_images_parallel(){
  for dir in ./*; do
    if directory_is_valid "$dir"; then
      images=$(grep -E '^\s+image:' "$dir/docker-compose.yml" | awk '{print $2}')
      for image in $images; do
        echo "Pulling Docker image: $image"
        perform_docker_pull $image &
      done
    fi
  done
  echo "Pulling Docker images in parallel... (just wait)"
  wait
}

perform_docker_pull() {
  docker pull $1 > /dev/null
}

docker_compose_pull(){
  # Loop through each subdirectory and perform docker-compose pull
  echo "Pulling Docker images..."
  for dir in ./*; do
    if directory_is_valid "$dir"; then
      (cd "$dir" && docker compose pull) 
    fi
  done
}

run_docker_compose_up(){
  # Loop through each subdirectory and perform docker-compose up -d
  for dir in ./*; do
    if directory_is_valid "$dir"; then
      echo "Starting Docker images: $dir"
      (cd "$dir" && docker compose up -d --remove-orphans &>/dev/null ) &
    fi
  done
  wait
}

stop_environment() {
  # Loop through each subdirectory and perform docker compose stop
  if confirm_action "Are you sure you want to STOP the environment?"; then
    for dir in ./*; do
      if directory_is_valid "$dir"; then
        (cd "$dir" && docker compose stop && cd ..)
      fi
    done
    echo "Docker images stoped"
  fi
}

destroy_environment() {
  # Loop through each subdirectory and perform docker compose down
  if confirm_action "Are you sure you want to DESTROY the environment?"; then
    for dir in ./*; do
      if directory_is_valid "$dir"; then
        (cd "$dir" && docker compose down && cd ..)
      fi
    done
    echo "Docker images destroyed"
  fi
}

clean_environment(){
  if confirm_action "Are you sure you want to CLEAN the system?"; then
    docker system prune -f
    docker image prune -a
    docker volume prune -f
    docker network prune -f
    sudo rm -rf ~/.local/share/Trash/*
    sudo rm -rf /var/lib/docker/volumes/*
    sudo rm -rf /var/lib/docker/network/files/*
    sudo rm -rf /var/lib/docker/containers/*
    sudo rm -rf /var/lib/docker/image/*
    echo "Cleaning system..."
    sudo apt autoremove -y
    sudo apt autoclean -y
    sudo apt clean -y
    echo "Clean completed."
  fi
}

is_destroy() {
  # Check if the destroy parameter was passed to the script
  if [[ "$1" == "destroy" ]]; then
    destroy_environment
    exit 0
  fi
}

is_stop() {
  # Check if the stop parameter was passed to the script
  if [[ "$1" == "stop" ]]; then
    stop_environment
    exit 0
  fi
}

is_pull() {
  # Check if the pull parameter was passed to the script
  if [[ "$1" == "pull" ]]; then
    if confirm_action "Are you sure you want to PULL all Docker images?"; then
      docker_compose_pull
    fi
  fi
}

is_pull_parallel() {
  # Check if the parallel parameter was passed to the script
  if [[ "$1" == "pull-parallel" ]]; then
    if confirm_action "Are you sure you want to PULL all Docker images in parallel?"; then
      pull_docker_images_parallel
      exit 0
    fi
  fi
}

is_setup() {
  # Check if the auto_setup parameter was passed to the script
  if [[ "$1" == "setup" ]]; then
    echo "Validating system requirements:"
    check_docker $2
    check_docker_network "services"
    check_docker_compose $2
    echo "Setting up Docker images..."
    pull_docker_images_parallel
    run_docker_compose_up
    wait
    exit 0
  fi
}

is_clean() {
  # Check if the auto_clean parameter was passed to the script
  if [[ "$1" == "clean" ]]; then
    clean_environment
    exit 0
  fi
}

check_hsds_already_installed() {
  # Check if hsds-cli is already installed
  if command -v hsds-cli &>/dev/null; then
    echo "[OK] - hsds-cli is already installed."
    return 0
  else
    echo "[WARN] - hsds-cli is not installed."
    if confirm_action "Do you want to INSTALL hsds-cli?"; then
      echo "Installing hsds-cli..."
      install_hsds-cli
      exit 0
    fi
    return 1
  fi
}

is_install() {
  # Check if the auto_install parameter was passed to the script
  if [[ "$1" == "install" ]]; then
    check_hsds_already_installed
  fi
}

compare_versions() {
    # Check if we have exactly 2 parameters
    if [ $# -ne 2 ]; then
        echo "Error: Function requires exactly 2 parameters."
        return 1
    fi

    local current_version=$1
    local latest_version=$2

    # Validate semantic version format (x.y.z where x,y,z are numbers)
    if ! [[ $current_version =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "Error: Current version '$current_version' doesn't match semantic versioning format (number.number.number)"
        return 1
    fi

    if ! [[ $latest_version =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "Error: Latest version '$latest_version' doesn't match semantic versioning format (number.number.number)"
        return 1
    fi

    # Split versions into components
    IFS='.' read -ra current <<< "$current_version"
    IFS='.' read -ra latest <<< "$latest_version"

    # Compare major version
    if [ ${current[0]} -lt ${latest[0]} ]; then
        echo "Update available: Your version ($current_version) is older than the latest version ($latest_version)"
        return 0
    elif [ ${current[0]} -gt ${latest[0]} ]; then
        return 1
    fi

    # Compare minor version
    if [ ${current[1]} -lt ${latest[1]} ]; then
        echo "Update available: Your version ($current_version) is older than the latest version ($latest_version)"
        return 0
    elif [ ${current[1]} -gt ${latest[1]} ]; then
        return 1
    fi

    # Compare patch version
    if [ ${current[2]} -lt ${latest[2]} ]; then
        echo "Update available: Your version ($current_version) is older than the latest version ($latest_version)"
        return 0
    elif [ ${current[2]} -gt ${latest[2]} ]; then
        return 1
    fi

    # Versions are equal or current is higher
    return 0
}

check_hsds-cli_version() {
  # Function to check the hsds-cli version
  # If the version is not the latest, update it
  local latest_version=$(curl -s https://api.github.com/repos/vshxp/home-server-docker-services/releases/latest | grep tag_name | cut -d '"' -f 4)
  local current_version=$(version)
  if compare_versions "$current_version" "$latest_version"; then
    echo "New version available: $latest_version."
  else
    echo "hsds-cli is the latest version."
    exit 0
  fi
}

is_update() {
  # Check if the auto_update parameter was passed to the script
  if [[ "$1" == "update" ]]; then
    echo "Checking for updates..."
    check_hsds-cli_version
    if confirm_action "Do you want to UPDATE hsds-cli?"; then
      echo "Updating hsds-cli..."
      install_hsds-cli
      exit 0
    fi
  fi
}

install_hsds-cli(){
  latest_version=$(curl -s https://api.github.com/repos/vshxp/home-server-docker-services/releases/latest | grep tag_name | cut -d '"' -f 4)
  echo "Installing hsds-cli v${latest_version}..."
  # curl -s "https://raw.githubusercontent.com/vshxp/home-server-docker-services/${latest_version}/install.sh" | bash
  
}

is_list() {
  # Check if the list parameter was passed to the script
  if [[ "$1" == "list" ]]; then
    docker ps
    exit 0
  fi
}

is_help() {
  if [[ "$1" == "help" ]]; then
    echo "---------------------------"
    echo "Home Server Docker Services"
    echo "hsds-cli v$(version)"
    echo "---------------------------"
    echo ""
    echo "Usage: $0 {destroy | stop | pull | setup | clean | update | parallel | help}"
    echo "Example: $0 setup"
    echo ""
    echo "Options:"
    echo " - destroy: Destroy the Docker images ( docker compose down )"
    echo " - stop: Stop the Docker images ( docker compose stop )"
    echo " - pull: Pull the Docker images ( docker compose pull )"
    echo " - setup: Setup the Docker images ( docker compose up -d )"
    echo " - list: List the Docker images ( docker ps )"
    echo " - clean: Clean the system "
    echo " - update: Update hsds-cli"
    echo " - pull-parallel: Pull Docker images in parallel"
    echo " - help: Display help"
    echo ""
    echo "Optional parameters:"
    echo " - quiet: Install requirements and containers without confirmation"
    echo "Example: $0 setup quiet"
    echo ""
    exit 0
  fi
}

version() {
  echo "4.0.0"
}

main() {
  if [[ -z "$1" || ! "$1" =~ ^("destroy"|"stop"|"pull"|"setup"|"clean"|"install"|"update"|"pull-parallel"|"list"|"help")$ ]]; then
    is_help "help"
  else
    is_destroy $1
    is_stop $1
    is_pull_parallel $1
    is_pull $1
    is_setup $@
    is_clean $1
    is_update $1
    is_help $1
    is_list $1
    is_install $1
  fi 
}

main "$@"
