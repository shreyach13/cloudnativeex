# Exercise 1

## Build a Jenkins Server With Pre-Installed Ansible, Docker, Packer, Kubernetes and aws-iam-authenticator

- The aim of this exercise is to build a server which will the following have pre-installed sofware: Jenkins, Ansible, Docker, Packer, Kubernetes and aws-iam-authenticator.

# Step 1

- Pull the latest code from the master branch.

- Open the `main.yml` file located in the `roles/jenkins/tasks` folder.

- Read the file to understand all the modules that will be installed in the AMI.

- Open the `packer_jenkins_ami.json` file.

- Change the ami name if you wish to:
  ```
  "ami_name": "Jenkins-Image-{{timestamp}}"
  ```

- Run the `packer validate` command:
  ```
  packer validate packer_jenkins_ami.json
  ```

- Run the `packer build` command:
  ```
  packer build packer_jenkins_ami.json
  ```
