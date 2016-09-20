## XAP Dockerfile


This repository contains **Dockerfile** of [GigaSpaces XAP](http://www.gigaspaces.com/xap-real-time-transaction-processing/overview)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Clone [xap-docker](https://github.com/Gigaspaces/xap-docker.git) 

3. cd xap-docker

4. Build an image from Dockerfile: `docker build -t gigaspaces/xap:12.0.1 .`


### Usage

#### Run XAP single space instance

    docker run -d gigaspaces/xap:12.0.1 -name myDataGrid 

#### Run XAP partition with a single primary and a single backup

    docker run -d gigaspaces/xap:12.0.1 -name myDataGrid -cluster schema=partitioned total_members=1,1 id=1    
    docker run -d gigaspaces/xap:12.0.1 -name myDataGrid -cluster schema=partitioned total_members=1,1 id=1 backup_id=1
    
#### More options
    [-name ...] [-cluster ...] [-properties ...] [-user xxx -password yyy] [-secured true/false]
    --help                                   : Shows this usage options menu
    -name [data grid name]        (required) : Specify the data grid name
    -cluster [cluster properties]            : Allows to specify cluster parameters
         schema=partitioned                  : The cluster schema to use
         total_members=1,1                   : The number of instances and number of backups to use
         id=1                                : The instance id of this processing unit
         backup_id=1                         : The backup id of this processing unit
    -properties [properties-loc]             : Location of context level properties
    -properties [bean-name] [properties-loc] : Location of properties used applied only for a specified bean
    -user x -password y                      : Configures a secured processing unit propagated with the supplied user and password
    -secured true                            : Configures a secured processing unit (implicit when using -user/-password)






