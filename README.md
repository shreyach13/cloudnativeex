# cloudnativeex

This repo is intended to be used by anyone who needs to have a basic understanding of how the Cloud Native tools work.

## Cloud Native Tools Exercises

- This repo contains exercises for basic understanding of Cloud Native tools. It is to be used
in conjunction with the Cloud Native Basic Onboarding Guide – v1.0 document.

- The information regarding the tools is contained in the document and the corresponding exercises are
contained in this repo.

- Each tool has its own folder with instructions to follow in the README file.

- To use it, clone the entire repo to your own local machine. Alternatively, in case you want to work on a specific exercise, clone that individual folder to your local machine.


### Pre-requisite(s)

- The exercises have been written presuming that they will be done on a MacBook and that the user
has access to AWS.

- List of software packages to be installed:

  * aws cli
  * brew
  * Ansible
  * wget
  * packer
  * terraform v0.12.16
  * docker
  * kubectl
  * minikube
  * kubectx
  * python
  * Atom / VS Code

- The user should already have a GitHub account. For the basics of Git, please refer to this link:
https://guides.github.com/introduction/git-handbook/

### How to Install The Required Packages on a MacBook

- Installing Homebrew:

  * Open the "`Terminal`" application, found in `/Applications/Utilities/`

  * Enter the following command into a single line on the terminal:
    ```sh
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ```

  * Hit `Return` and you will see a series of lines about what the script will install and where it will be installed. Hit `Return` again to accept or hit `Escape` to cancel.

  * Enter the administrator password (required by `sudo` execution) to begin the installation.

  * Upon completion, you will see an “Installation successful!” message.

  * For more information on Homebrew, see https://brew.sh

- To install any of the packages mentioned above using brew :
    ```
    brew install <package name>
    example: brew install wget
    ```

- To install the aws cli:

  https://docs.aws.amazon.com/cli/latest/userguide/install-cliv1.html


- To configure the AWS CLI:

  https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html
