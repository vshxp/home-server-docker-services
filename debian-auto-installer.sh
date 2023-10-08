#!/bin/bash



export DOCKER_STORAGE_PATH="~/Storage/Docker"


check_docker() {
  #Check if a docker is installed, if not install it

  if command -v docker &>/dev/null; then
    echo "Docker is installed."
  else
    echo "Docker is not installed."
    sudo apt update
    sudo apt remove docker docker-engine docker.io -y

    sudo apt install apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    docker-compose -y

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add –
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable" 

    sudo apt update
    sudo apt install docker-ce
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker

    clear
    echo '[DONE] Docker Install'
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
    if [[ -d "$dir" ]]; then
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
  for dir in ./*; do
    if [[ -d "$dir" ]]; then
      (cd "$dir" && docker-compose up -d && cd ..)
    fi
  done

  # Wait for all background processes to complete
  wait
  echo "All docker images running"
}

run_auto_setup(){
  # Loop through each subdirectory and run auto_configure.sh script to auto configure the service 
  for dir in ./*; do
    if [[ -d "$dir" ]]; then
      (cd "$dir" && sh auto_configure.sh && cd ..)
    fi
  done

  # Wait for all background processes to complete
  wait
  echo "All docker images running"
}

check_docker
check_docker_network "media"
check_docker_network "services"
check_docker_network "steam"
pull_docker_images
wait
run_docker_compose


