#!/bin/bash
check_docker() {
  #Check if a docker is installed, if not install it

  if command -v docker &>/dev/null; then
    echo "Docker is installed."
  else
    echo "Docker is not installed."
    for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
    
    sudo apt update && sudo apt install apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    docker-compose -y

    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh

    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker

    clear
    echo '[DONE] Docker Installed'
  fi
}
check_docker_compose() {
  #Check if a docker is installed, if not install it
  
  if command -v docker compose &>/dev/null; then
    echo "Docker is installed."
  else
    echo "Docker is not installed."   
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose    
    echo '[DONE] Docker Installed'
  fi
}
check_docker_network() {
  # Function to check if a Docker network exists, if not create it

  local network_name="$1"

  if docker network inspect "$network_name" &>/dev/null; then
    echo "Docker network '$network_name' exists."
  else
    echo "Docker network '$network_name' does not exist."
    docker network create $network_name
    echo "Docker network '$network_name' created."
  fi
}
pull_docker_images(){
  # get and update all docker images
  # Use 'grep' to find the image lines and then 'awk' to extract the image names
  # then for each image perform docker pull

  for dir in ./*; do
    if [[ -d "$dir"  && ! "$dir" == *_archive* ]]; then
    echo "updating image: $dir"
      images=$(grep -E '^\s+image:' "$dir/docker-compose.yml" | awk '{print $2}')
      for image in $images; do
        perform_docker_pull $image &
      done
    fi
  done
}
perform_docker_pull() {
  docker pull $1
}
run_docker_compose(){
  # Loop through each subdirectory and perform docker-compose up -d
  echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
  for dir in ./*; do
    if [[ -d "$dir" && ! "$dir" == *_archive*  ]]; then
      (cd "$dir" && sudo docker compose up -d --remove-orphans && cd ..)
    fi
  done

  # Wait for all background processes to complete
  wait
  echo "Docker images running"
}
run_auto_setup(){
  # Loop through each subdirectory and run auto_configure.sh script to auto configure the service 
  for dir in ./*; do
    if [[ -d "$dir" && ! "$dir" == *_archive* ]]; then
      (cd "$dir" && sh auto_configure.sh && cd ..)
    fi
  done
  wait
  echo "All docker images auto configured."
}
run_auto_clean(){
  echo "Removing trash......."
  docker system prune -f
  docker image prune -a
  sudo rm -rf ~/.local/share/Trash/*
  rm -rf ~/.local/share/Trash/*
}
check_docker
check_docker_network "services"
pull_docker_images
wait
check_docker_compose
run_docker_compose
run_auto_clean