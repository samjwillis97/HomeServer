#!/bin/dash
echo "git pull"
git pull
cp /home/sam/docker/docker-compose.yml /home/sam/docker/docker-compose.bak
cp docker-composet1.yml /home/sam/docker/docker-compose.yml
echo