# Docker

## Excercise:

The goals of this exercise are:

* To create a docker image of Jenkins 
* Host the docker image locally
* To host the generated Jenkins image into ECR in AWS

- [ ] Clone the contents of Docker folder into your local 
- [ ] Create a Dockerfile with the following:



```
FROM ubuntu:18.04
LABEL maintainer = “ ”                <---- (fill in your name)
RUN apt-get update && \
 apt-get install default-jre -y
ADD ./jenkins.war /usr/local/etc/
ADD ./start_jenkins.sh /.
RUN /bin/bash -c ‘chmod +x /start_jenkins.sh’
CMD [ “/bin/sh”, “/start_jenkins.sh” ]
```


- [ ] Create a “start_jenkins.sh” start script

```
/usr/bin/java -jar /usr/local/etc/jenkins.war
```

- [ ] Download the “Jenkins.war” file to the build directory using the command:

```
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
```

- [ ] Building the container:

```
docker build --tag ubuntu_jenkins .
```

- [ ] Launch the container using:

```
docker run -p 8080:8080 -p 50000:50000 -it ubuntu_jenkins
```


- [ ] Docker-compose - Building a Jenkins container with volumes


Create a “docker-compose.yml” file.

```
version: ‘2’
services:
 jenkins:
   image: ‘ubuntu_jenkins:latest’
   labels:
     kompose.service.type: nodeport
   ports:
     - ‘80:8080’
     - ‘443:8443’
     - ‘50000:50000’
   volumes:
     - ‘jenkins_data:/jenkins_config’
volumes:
 jenkins_data:
   driver: local   
``` 


The “ubuntu_jenkins:latest” image had been created locally by myself earlier.


Launch using:

```
docker-compose up
```
