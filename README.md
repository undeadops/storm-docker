storm-docker
============

Dockerfiles for building a storm cluster.

My repo is based off of [https://github.com/wurstmeister/storm-docker](https://github.com/wurstmeister/storm-docker)
Inspired by [https://github.com/ptgoetz/storm-vagrant](https://github.com/ptgoetz/storm-vagrant)

The images are available directly from [https://index.docker.io](https://index.docker.io)

##Pre-Requisites

- install docker-compose [http://docs.docker.com/compose/install/](http://docs.docker.com/compose/install/)

##Usage

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
      image: undeadops/storm-ui:0.9.4
	    ports:
	      "8080:8080"

This tells Docker to expose the Docker UI container's port 8080 as port 8080 on the host<br/>

If you are running docker natively you can use localhost. If you're using boot2docker, then do:

    $ boot2docker ip
    The VM's Host only interface IP address is: 192.168.99.100

Which returns your docker VM's IP.<br/>
So, to open storm UI, type the following in your browser:

    localhost:8080

or

    192.168.99.100:8080

in my case.

### How can I deploy a topology?
Since the nimbus host and port are not default, you need to specify where the nimbus host is, and what is the nimbus port number.<br/>
Following the example above, after discovering the nimbus host IP (could be localhost, could be our docker VM ip as in the case of boot2docker), run the following command:

    storm jar target/your-topology-fat-jar.jar com.your.package.AndTopology topology-name -c nimbus.host=192.168.99.100 -c nimbus.thrift.port=49627

### How can I connect to one of the containers?
Find the forwarded ssh port for the container you wish to connect to (use `docker-compose ps`)

    $ docker exec -it `docker ps | grep ui | awk '{ print $1 }'` /bin/bash
