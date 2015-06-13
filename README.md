## Valve Dockerfile


This directory contains **Dockerfile** of the beta version of [Ubiquiti's Unifi Controller](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-4-6-3-is-released/ba-p/1215585) for [Docker](https://www.docker.com/).


### Base Docker Image

* [ubuntu](https://registry.hub.docker.com/_/ubuntu/)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/gizmoguy/unifi/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull gizmoguy/unifi`


### Usage

    docker run -d -p 80:80 -p 443:443 -d gizmoguy/unifi
