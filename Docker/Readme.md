# Docker

## Excercise:

The goals of this exercise are:

* To create a docker image of Jenkins 
* Host the docker image locally
* To host the generated Jenkins image into ECR in AWS

- [ ] Clone the contents of Docker folder into your local 
- [ ] - Create a Dockerfile with the following:
_____________________________________________________________Dockerfile____

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

____________________________________________________________________________


- [ ] Create a “start_jenkins.sh” start script
_______________________________________________________start_jenkins.sh____
/usr/bin/java -jar /usr/local/etc/jenkins.war
____________________________________________________________________________
- [ ] Download the “Jenkins.war” file to the build directory using the command:
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
- [ ] Building the container:
docker build --tag ubuntu_jenkins .
- [ ] Launch the container using:

```
docker run -p 8080:8080 -p 50000:50000 -it ubuntu_jenkins
```

