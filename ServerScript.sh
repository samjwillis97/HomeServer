#!/bin/bash
# Ideally add a loop to  environment variables required are within the environment file
#
RED='\033[0;31m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}Moving to github directory${NC}"
pushd /home/sam/github/HomeServer
echo -e "${CYAN}Git pull${NC}"
git pull
echo -e "${CYAN}Updating Script${NC}"
pushd +1
cp /home/sam/github/HomeServer/ServerScript.sh /home/sam/ServerScript.sh
echo -e "${CYAN}Moving to docker-compose directory${NC}"
pushd /home/sam/docker/
echo -e "${CYAN}Backing up previous compose file${NC}"
cp /home/sam/docker/docker-compose.yml /home/sam/docker/docker-compose.bak
echo -e "${CYAN}Importing compose from repository${NC}"
cp /home/sam/github/HomeServer/docker-composet1.yml /home/sam/docker/docker-compose.yml
echo -e "${CYAN}Attempting docker recreate${NC}"
docker-compose -f ~/docker/docker-compose.yml up -d