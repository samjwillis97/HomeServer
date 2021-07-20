# HomeServer
Ubuntu Homeserver Setup files and guide

See below for more useful information:

- https://www.smarthomebeginner.com/google-oauth-with-traefik-2-docker/
- https://www.smarthomebeginner.com/traefik-2-docker-tutorial/#Traefik_2_Setup
- https://linuxize.com/post/how-to-mount-an-nfs-share-in-linux/

## Initial Setup Guide

1. Create .env File
2. Run CreateServer.sh as sudo
3. Forward Ports 80 and 443 on Modem to the Servers LAN IP
4. Create Docker-Compose with only networks and socket-proxy, ensure working
5. Add Traefik with Line un-commented for testing, ensure working
6. Remove old acme.json create new one with 600 perms, re-comment line
7. Add cf-ddns and cf-companion

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
# Use HTTP Password Generator (htpasswd file) and fill ^
mkdir ~/docker/appdata
mkdir ~/docker/appdata/traefik2
mkdir ~/docker/appdata/traefik2/acme
touch ~/docker/appdata/traefik2/acme/acme.json
chmod 600 ~/docker/appdata/traefik2/acme/acme.json
touch ~/docker/appdata/traefik2/traefik.log
```

## Required Containers

- Traefik v2 :heavy_check_mark:
  - Reverse Proxy + Lets Encrypt
- Docker Socket Proxy :heavy_check_mark:
  - For improved security of Docker
- Google Oauth :heavy_check_mark:
  - Google Two Factor Auth
- Portainer :heavy_check_mark:
  - Container Management WebUI
- MariDB :heavy_check_mark:
  - MySQL Database
- Transmission :heavy_check_mark:
  - Torrent Client
- NZBGet :heavy_check_mark:
  - Usenet Downloader
- Jackett :heavy_check_mark:
  - Torrent Indexer
- NZBHydra v2 :heavy_check_mark:
  - Usenet MetaSearch
- Radarr :heavy_check_mark:
  - Movie Manager
- Sonarr :heavy_check_mark:
  - TV Show Manager
- Ombi :heavy_check_mark:
  - Media Requests
- Tautulli :heavy_check_mark:
  - Plex Statistics
- Bazarr :heavy_check_mark:
  - Subtitle Management
- Plex :heavy_check_mark:
  - Media Server
- Grafana
  - Dashboard Software
- InfluxDB v1
  - Influx Database for Varken
- Varken
  - Plex/Influx/Grafana aggregator
- Code Server :heavy_check_mark:
  - Remote VS Code
- Guacamole :heavy_check_mark:
  - Remote Access
- DockerGC :heavy_check_mark:
  - Docker Garbage Collector
- Uptime :heavy_check_mark:
  - Uptime monitoring 
- Dozzle :heavy_check_mark:
  - Docker log viewer
- CertDumper
  - Extract LetsEncrypt Certificates
- CF companion :heavy_check_mark:
  - Automatic CNAME DNS Creation on Cloudflare
- CF DDNS :heavy_check_mark:

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
  - CLOUDFLARE_EMAIL
  - CLOUDFLARE_ZONEID
- Databases
  - MARIADB_PORT
  - GUACDB_USER
  - GUACDB_PASS
  - GUACDB
- Security
  - MY_EMAIL
  - HTTP_USERNAME
  - HTTP_GOOGLE_CLIENT_ID
  - GOOGLE_CLIENT_SECRET
  - OAUTH_SECRET
  - CLOUDFLARE_API_TOKEN
    - Use Zone DNS Template
  - RADARR_API_KEY
  - SONARR_API_KEY
  - BAZARR_API_KEY
  - PLEX_CLAIM
  - TRANSMISSION_USER
  - TRANSMISSION_PASS
  - CODESERVER_PASS
  - MYSQL_ROOT_PASSWORD
- Notifications
- Ports
  - PLEX_PORT

## Secrets

- HTTP Password
- Cloudflare Email
- Cloudflare API Key
- Clouflare API Token