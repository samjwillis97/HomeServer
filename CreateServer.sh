#!/bin/bash
# attempt to automate creation of server, should be run as sudo
if [ ! -f .env ]
then
    export $(cat .env | sed 's/#.*//g' | xargs)
fi

#VARIABLES
echo "Main user:"
echo $USER

echo "Directory for docker:"
echo $DOCKER_DIR

# docker pre-reqs
apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update -y

# installing docker
apt-get install docker-ce -y

# installing docker-compose
curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# setting up directories and permissions
usermod -aG docker ${USER}
mkdir ${DOCKER_DIR}
touch ${DOCKER_DIR}/.env
cp ./environment ${DOCKER_DIR}/.env
# FILL OUT  
sudo chmod -R 775 ${DOCKER_DIR}
mkdir ${DOCKER_DIR}/shared
mkdir -p ${DOCKER_DIR}/traefik/acme
touch ${DOCKER_DIR}/traefik/acme/acme.json
chmod 600 ${DOCKER_DIR}/traefik/acme/acme.json
# FILL OUT
touch ${DOCKER_DIR}/traefik/rules.toml
# FILL OUT
docker create network traefik_proxy
# FORWARD PORTS 8 and 443 to Server
touch ${DOCKER_DIR}/docker-compose.yml
cp ./docker-composet1.yml ${DOCKER_DIR}/docker-compose.yml
# copy compose file
# docker-compose -f ~/docker/docker-compose.yml up -d