# Docker

## Excercise

### Step 1

The goals of this exercise are:

* To create a docker image of Jenkins.
* To host the docker image locally.
* To host the generated Jenkins image into ECR in AWS.

Steps

- Clone the contents of the Docker folder into your local machine (unless you have cloned the entire repo already).

- Create a Dockerfile with the following:
  ```
  FROM ubuntu:18.04
  LABEL maintainer = “ ”         <---- (fill in your name)
  RUN apt-get update && \
   apt-get install default-jre -y
  ADD ./jenkins.war /usr/local/etc/
  ADD ./start_jenkins.sh /.
  RUN /bin/bash -c ‘chmod +x /start_jenkins.sh’
  CMD [ “/bin/sh”, “/start_jenkins.sh” ]
  ```

- Create a “start_jenkins.sh” shell script using your favorite editor and add the following line:
  ```
  /usr/bin/java -jar /usr/local/etc/jenkins.war
  ```

- Download the “Jenkins.war” file to the build directory using the following command:
  ```
  wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
  ```

- Use the following command to build the container:
  ```
  docker build --tag ubuntu_jenkins .
  ```

- Launch the container using the following command:
  ```
  docker run -p 8080:8080 -p 50000:50000 -it ubuntu_jenkins
  ```

Our docker container is now up and running on our local machine. We can check it using the following command:
  ```
  docker ps
  ```

### Step 2

The next step is to add a volume to the docker container:

- Docker-compose - Building a Jenkins container with volumes

- Create a "docker-compose.yml" file containg the following lines. Note: spaces are important!
  ```
  version: '2'
  services:
   jenkins:
     image: 'ubuntu_jenkins:latest'
     labels:
       kompose.service.type: nodeport
     ports:
       - '80:8080'
       - '443:8443'
       - '50000:50000'
     volumes:
       - 'jenkins_data:/jenkins_config'
  volumes:
   jenkins_data:
     driver: local   
  ``` 

The `ubuntu_jenkins:latest` image has been created locally by myself earlier.

Launch the containe using the follwoing command:
  ```
  docker-compose up
  ```

### Step 3

Upload your Jenkins image to AWS ECR.

- Create your own ECR repo using the aws cli:
  ```
  aws ecr create-repository --repository-name <repo name> 
  ```

  Example Output:
  ```
  {
      "repository": {
          "registryId": "1234567890",
          "repositoryName": "jimage",
          "repositoryArn": "arn:aws:ecr:us-east-1:1234567890:repository/jimage",
          "createdAt": 1573744778.0,
          "repositoryUri": "1234567890.dkr.ecr.us-east-1.amazonaws.com/jimage"
      }
  }
  ```

Type the following command in the terminal to login into ECR:
  ```
  aws ecr get-login --region <region> --no-include-email
  ```

- Copy/paste the value generated in your terminal.

- Tag your Jenkins image using the floowing command:
  ```
  docker tag <Image ID> <repository URL>/<repo name>
  ```
  Example:
  ```
  docker tag d880d475808f 1234567890.dkr.ecr.us-east-1.amazonaws.com/jimage
  ```

- Push your Jenkins image to ECR using the following command:
  ```
  docker push <repository URI>/<repo name>
  ```
  Example:
  ```
  docker push 1234567890.dkr.ecr.us-east-1.amazonaws.com/jimage
  ```
