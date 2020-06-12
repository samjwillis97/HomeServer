#!/bin/bash
echo "Moving to github directory"
pushd /home/sam/github/HomeServer
echo "Git pull"
git pull
echo "Updating Script"
pushd +1
cp /home/sam/github/Homeserver/ServerScript.sh ServerScript.sh
echo "Moving to docker-compose directory"
pushd /home/sam/docker/
echo "Backing up previous compose file"
cp /home/sam/docker/docker-compose.yml /home/sam/docker/docker-compose.bak
echo "Importing compose from repository"
cp /home/sam/github/HomeServer/docker-composet1.yml /home/sam/docker/docker-compose.yml
echo "Attempting docker recreate"
docker-compose -f ~/docker/docker-compose.yml up -d