# HomeServer
HomeServer documents and files

git commit -am "comment"
git push

## Required Containers

- Traefik v2
  - Reverse Proxy + Lets Encrypt
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
  - INDEX_DIR
  - DOWNLOAD_DIR
  - MEDIA_DIR
  - TV_DIR
  - SECRETS_DIR
- Domain
  - DOMAINNAME
  - CLOUDFLARE_EMAIL
  - CLOUDFLARE_API_KEY
- Databases
  - MARIA_HOST
  - MARIA_PORT
  - MARIA_ROOT_PASSWORD
- Security
  - HTTP_USERNAME
  - HTTP_PASSWORD
  - GOOGLE_CLIENT_ID
  - GOOGLE_CLIENT_SECRET
  - OAUTH_SECRET
- Notifications
- Ports
  - TRAEFIK_DASH_PORT
  - PORTAINER_PORT
  - JACKETT_PORT
  - RADARR_PORT
  - SONARR_PORT
  - PLEX_PORT
  - PLEX_WEB_TOOLS_PORT
  - OMBI_PORT
  - TAUTULLI_PORT
  - GRAFANA_PORT
  - INFLUX_PORT
- Plex
  - PLEX_CLAIM