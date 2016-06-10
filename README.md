## XAP Dockerfile


This repository contains **Dockerfile** of [XAP](http://www.gigaspaces.com/xap-real-time-transaction-processing/overview)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Clone [xap-docker](https://github.com/Gigaspaces/xap-docker.git) 

3. cd xap-docker

4. Build an image from Dockerfile: `docker build -t xap/xap:12.0.0 .`


### Usage

#### Run `XAP` single space instance

    docker run -d xap/xap:12.0.0

#### Run `XAP` partition with a single primary and a single backup

    docker run -d xap/xap:12.0.0 -name spaceName -cluster schema=partitioned total_members=1,1 id=1    
    docker run -d xap/xap:12.0.0 -name spaceName -cluster schema=partitioned total_members=1,1 id=1 backup_id=1

