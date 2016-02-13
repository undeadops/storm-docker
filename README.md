storm-docker
============

Dockerfiles for building a storm cluster.

My repo is based off of [https://github.com/wurstmeister/storm-docker](https://github.com/wurstmeister/storm-docker)
Inspired by [https://github.com/ptgoetz/storm-vagrant](https://github.com/ptgoetz/storm-vagrant)

The images are available directly from [https://hub.docker.com/u/undeadops/](https://hub.docker.com/u/undeadops/)

##Pre-Requisites for OSX Development (main purpose of this currently)

- Install [Docker-Toolbox](https://www.docker.com/products/docker-toolbox)

  Create boot2docker image like so:

    ```docker-machine create --virtualbox-memory "4096" --virtualbox-cpu-count "4" -d virtualbox dev```

  This will create a VirtualBox VM named "dev" with 4G memory and 4 vCPUs

  Add the next line to your ~/.bashrc or ~/.zshrc file:

    ```eval "$(docker-machine env dev)"```

  This will make sure the docker commands on your OSX Box map to your VirtualBox VM.

##Usage
Checkout Repo:

  ```git clone https://github.com/undeadops/storm-docker```

Start a cluster:

- ```docker-compose up```

Destroy a cluster:

- ```docker-compose stop```

Add more supervisors:

- ```docker-compose scale supervisor=3```

##Building

- ```rebuild.sh```

##FAQ
### How can I access Storm UI from my host?
Take a look at docker-compose.yml:

    ui:
      image: undeadops/storm-ui
	    ports:
	      - "8080:8080"
      links:
        - "zookeeper:zk"
        - "nimbus:nimbus"

This tells Docker to expose the Docker UI container's port 8080 as port 8080 on the host<br/>

If you are running docker natively you can use localhost. If you're using boot2docker, then do:

    ```$ docker-machine ip dev```
    The VM's Host only interface IP address is: 192.168.99.100

Which returns your docker VM's IP.<br/>
So, to open storm UI, type the following in your browser:

    192.168.99.100:8080

in my case.

### How can I deploy a topology?
Since the nimbus host and port are not default, you need to specify where the nimbus host is, and what is the nimbus port number.<br/>
Following the example above, after discovering the nimbus host IP (could be localhost, could be our docker VM ip as in the case of boot2docker), run the following command:

    storm jar target/your-topology-fat-jar.jar com.your.package.AndTopology topology-name -c nimbus.host=192.168.99.100 -c nimbus.thrift.port=49627

### How can I connect to one of the containers?

    $ docker exec -it `docker ps | grep ui | awk '{ print $1 }'` /bin/bash
