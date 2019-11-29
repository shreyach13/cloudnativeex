# Build a Jenkins EC2 instance using Terraform

## Step 3

- The aim of this exercise is to :
  * Create an S3 bucket which will store the terraform state file.
  * Create a security group and define the ports.
  * Use the AMI which we created in the Step 1.
  * Create a keypair to be used to `ssh` into the EC2 instance.

- At the end of the exercise you should have an EC2 instance using the AMI created in the previous Step.

### Steps to follow:

- Pull the code from the repo. unless you have cloned the entire repo. In the latter case, change into the `terraform/Build-Jenkins-AMI_and_EC2/Step3_Build_Jenkins_EC2` folder.

- Navigate to the `app` folder.

- In the `backend.hcl` file, change the name of S3 bucket (the names of the S3 buckets must be unique since they are global).

- In the `backend.tf` file, create the folder structure for the S3 bucket to store the file (in the `key` variable).

- In the `variables.tf` file, define the name that you want as the owner tag.

- Navigate to the `../modules/compute/` folder.

- In the `main.tf` file, replace '`shreya-jenkins-server`' with the name of your ami.

- Replace the key-pair name '`Shreya_KP`' with the name you want to use when you create your key-pair.

- Replace the value of public key with your public key. Hint: Get your public key from the `id_rsa.pub` file.

- Replace the value of `aws_instance` with what you would like the webserver to be and do the same for the `ami`, `key_name` and `Name` tag of the resource in the `main.tf` file.

- In the `/module/security/` folder replace the security group name and the ip address in the files.

- Navigate to the `app` folder

- To create an S3 bucket and set up the terraform state file:
  ```
  terraform init -backend-config=backend.hcl
  ```

- Check if the S3 bucket was created as expected.

- To validate your terraform code:
  ```
  terraform validate
  ```

- To check your terraform plan:
  ```
  terraform plan
  ```

- To apply your terraform code and create the infrastructure:
  ```
  terraform apply
  ```
