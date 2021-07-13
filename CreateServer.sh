#!/bin/bash
# attempt to automate creation of server, should be run as sudo
# if [ ! -f .env ]
# then
    # export $(cat .env | sed 's/#.*//g' | xargs)
# fi
set -o allexport; source ./.env; set +o allexport

# CONSTANTS
RED='\033[0;31m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color


#VARIABLE CHECKS
if [ -z "$DOCKER_DIR" ]
then
      echo -e "${RED}\$DOCKER_DIR not set${NC}"
      exit 1
fi
if [ -z "$SECRETS_DIR" ]
then
      echo -e "${RED}\$SECRETS_DIR not set${NC}"
      exit 1
fi

# docker pre-reqs
echo -e "${CYAN}Installing Docker Pre Reqs${NC}"

apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"


echo -e "${CYAN}Updating${NC}"

apt-get update -y

# installing docker
echo -e "${CYAN}Installing Docker CE${NC}"

apt-get install docker-ce -y

# installing docker-compose
echo -e "${CYAN}Installing Docker Compose${NC}"

curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# setting up directories and permissions
echo -e "${CYAN}Setting up Directories${NC}"

usermod -aG docker $USER

mkdir $DOCKER_DIR
setfacl -Rdm g:docker:rwx $DOCKER_DIR
chmod -R 775 $DOCKER_DIR
touch $DOCKER_DIR/.env
touch $DOCKER_DIR/docker-compose.yml
mkdir $SECRETS_DIR
touch $SECRETS_DIR/httpassword
mkdir -p $DOCKER_DIR/appdata/traefik2/acme
touch $DOCKER_DIR/appdata/traefik2/acme/acme.json
chmod 600 $DOCKER_DIR/appdata/traefik2/acme/acme.json
touch $DOCKER_DIR/appdata/traefik2/traefik.log
mkdir -p $DOCKER_DIR/appdata/docker-gc
touch $DOCKER_DIR/appdata/docker-gc/docker-gc-exclude
# cp -r ./traefik/rules $DOCKER_DIR/appdata/traefik2/

echo -e "${CYAN}Success!${NC}"
