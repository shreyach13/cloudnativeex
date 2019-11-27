FROM ubuntu:18.04
LABEL maintainer = “ErikV”                
RUN apt-get update && \
 apt-get install default-jre -y
ADD ./jenkins.war /usr/local/etc/
ADD ./start_jenkins.sh /.
RUN /bin/bash -c 'chmod +x /start_jenkins.sh'
CMD [ "/bin/sh", "/start_jenkins.sh" ]
