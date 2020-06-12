#!/bin/bash
# Ideally add a loop to check environment variables required are within the environment file

CYAN='\033[1;36m'

echo -e "${CYAN}Moving to github directory"
pushd /home/sam/github/HomeServer
echo -e "${CYAN}Git pull"
git pull
echo -e "${CYAN}Updating Script"
pushd +1
cp /home/sam/github/HomeServer/ServerScript.sh /home/sam/ServerScript.sh
echo -e "${CYAN}Moving to docker-compose directory"
pushd /home/sam/docker/
echo -e "${CYAN}Backing up previous compose file"
cp /home/sam/docker/docker-compose.yml /home/sam/docker/docker-compose.bak
echo -e "${CYAN}Importing compose from repository"
cp /home/sam/github/HomeServer/docker-composet1.yml /home/sam/docker/docker-compose.yml
echo -e "${CYAN}Attempting docker recreate"
docker-compose -f ~/docker/docker-compose.yml up -d