# HomeServer
Ubuntu Homeserver Setup files and guide

## Initial Setup Guide

```shell
# Setup Server
adduser USER
usermod -aG sudo USER
# Install Docker
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce
# Install Docker Compose
sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# Add user to Docker Group
sudo usermod -aG docker ${USER}
# Setup docker Directory
mkdir ~/docker
sudo setfacl -Rdm g:docker:rwx ~/docker
sudo chmod -R 775 ~/docker
touch ~/docker/.env
touch ~/docker/docker-compose.yml
mkdir ~/docker/secrets
# Set up for Traefik 2
touch ~/docker/secrets/httpassword
echo $(htpasswd -nb username mystrongpassword) | sed -e s/\\$/\\$\\$/g
mkdir ~/docker/appdata
mkdir ~/docker/appdata/traefik2
mkdir ~/docker/appdata/traefik2/acme
touch ~/docker/appdata/traefik2/acme/acme.json
chmod 600 ~/docker/appdata/traefik2/acme/acme.json
touch ~/docker/appdata/traefik2/traefik.log
```

## Required Containers

- Traefik v2
  - Reverse Proxy + Lets Encrypt
- Docker Socket Proxy
  - For improved security of Docker
- Google Oauth 
  - Google Two Factor Auth
- Portainer
  - Container Management WebUI
- MariaDB
  - MySQL Database
- PHPMyAdmin
  - MariaDB Web Interface
- InfluxDB v2
  - Influx Database for Personal Projects
- Deluge
  - Torrent Client
- NZBGet
  - Usenet Downloader
- Jackett
  - Torrent Indexer
- NZBHydra v2
  - Usenet MetaSearch
- Radarr
  - Movie Manager
- Sonarr
  - TV Show Manager
- Ombi
  - Media Requests
- Tautulli
  - Plex Requests
- Bazarr
  - Subtitle Management
- Plex
  - Media
- Grafana
  - Dashboard
- qDirStat
  - Directory Statistics
- DockerGC
  - Docker Garbage Collector
- CertDumper
  - Extract LetsEncrypt Certificates
- CF companion
  - Automatic CNAME DNS Creation on Cloudflare

## Environment Variables

- System
  - PUID
  - PGID
  - TZ
  - SERVER_IP
  - PUBLIC_IP
- Directories
  - USER_DIR
  - DOCKER_DIR
  - SECRETS_DIR
  - DOWNLOAD_DIR
  - MEDIA_DIR
  - TV_DIR
  - MOVIE_DIR
- Domain
  - DOMAINNAME
- Databases
  - MARIA_HOST
  - MARIA_PORT
- Security
  - HTTP_USERNAME
- Notifications
- Ports
  - TRAEFIK_DASH_PORT
  - PORTAINER_PORT
  - DELUGE_PORT
  - JACKETT_PORT
  - RADARR_PORT
  - SONARR_PORT
  - PLEX_PORT
  - PLEX_WEB_TOOLS_PORT
  - OMBI_PORT
  - TAUTULLI_PORT
  - GRAFANA_PORT
  - INFLUX_PORT

## Secrets

- HTTP Password
- Cloudflare Email
- Cloudflare API Key
- Clouflare API Token
- Oauth Secret
- Google Client Secret
- Google Client ID
- My Email
- Plex Claim
- Traefik Pilot Token
- MariaDB Root Password
- InfluxDB Root Password