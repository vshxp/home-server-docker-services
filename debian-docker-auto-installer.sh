#!/bin/bash

check_sudo() {
  if [ "$EUID" -ne 0 ]; then
    echo "This script must be run with sudo."
    exit 1
  fi
}

#Check if a docker is installed, if not install it
check_docker() {
  if command -v docker &>/dev/null; then
    echo "Docker is installed."
  else
    echo "Docker is not installed."
    apt update
    apt remove docker docker-engine docker.io -y

    apt install apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    docker-compose -y

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add –
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable" 

    apt update
    apt install docker-ce
    usermod -aG docker $USER
    clear
    echo '[DONE] Docker Install'
  fi
}

# Function to check if a Docker network exists, if not create it
check_docker_network() {
  local network_name="$1"

  if docker network inspect "$network_name" &>/dev/null; then
    echo "Docker network '$network_name' exists."
  else
    echo "Docker network '$network_name' does not exist."
    docker network create $network_name
  fi
}

# Function to perform the docker-compose up in a subdirectory
perform_docker_compose() {
    local dir="$1"
    echo "Turning up: $dir"
    (cd "$dir" && docker-compose up -d)
}

check_sudo
check_docker
check_docker_network "media"
check_docker_network "services"

# Loop through each subdirectory in parallel
# path="."
# for dir in "$path"/*; do
for dir in ./*; do
    if [[ -d "$dir" ]]; then
        perform_docker_compose "$dir" &
    fi
done

# Wait for all background processes to complete
wait

echo "Server fully configured"