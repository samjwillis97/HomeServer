#!/bin/dash
echo "Git pull"
git pull
echo "Backing up previous compose file"
cp /home/sam/docker/docker-compose.yml /home/sam/docker/docker-compose.bak
echo "Importing compose from repository"
cp docker-composet1.yml /home/sam/docker/docker-compose.yml
echo "Attempting docker recreate"
docker-compose -f ~/docker/docker-compose.yml up -d