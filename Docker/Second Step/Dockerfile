FROM ubuntu:latest

LABEL maintainer = "ShreyaC"

RUN apt-get update && \
  apt-get install default-jre -y

ADD ./jenkins.war /usr/local/etc
ADD ./ubuntu_jenkins.sh /.

RUN /bin/bash -c 'chmod +x /ubuntu_jenkins.sh'
CMD ["/bin/sh", "/ubuntu_jenkins.sh"]
