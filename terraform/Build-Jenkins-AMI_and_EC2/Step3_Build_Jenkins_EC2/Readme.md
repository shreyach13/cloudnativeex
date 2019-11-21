# Build Jenkins EC2 using Terraform

## Step 3

- [ ] The aim of this exercise is to :
* Create a s3 bucket which will store the terraform state file
* Create a security group and define the ports
* Use the AMI which we created in the Step 1
* Create a keypair to be used to SSH into the EC2 instance


- [ ] At the end of the exercise you should have an EC2 instance using the AMI created in the previous Step


### Steps to follow:

- [ ] Pull the code from the repo
- [ ] Navigate to the 'app' folder
- [ ] In the backend.hcl file, change the name of s3 bucket (the names of the s3 buckets should
be unique globally
- [ ] In the backend.tf file, create the folder structure in want in s3 bucket to store the file ( in key variable ) .
- [ ] In the variable.tf file, define the name that you want in the owner tags

- [ ] Navigate to the /module/compute/
- [ ] In the main.tf file, replace 'shreya-jenkins-server' with the name of your ami.
- [ ] Replace key-pair name 'Shreya_KP' with the name with which you want to create your key-pair.
- [ ] Replace the value of public key with your public key. Hint: Get your public key from id_rsa.pub file.
- [ ] Replace the value of 'aws_instance' with what you would like the webserver to be and same in the 'ami', 'key_name', 
'Name' tag of resource and also in variable.tf file.
- [ ] In the /module/security/ folder replace security group name and ip address in the files.

- [ ] Navigate to the 'app' folder
- [ ] To create a s3 bucket and terraform state file set up:
```
terraform init -backend-config=backend.hcl
```

- [ ] Check if the s3 bucket is created appropriately

- [ ] To validate
```
terraform validate
```

- [ ] To check plan
```
terraform plan
```

- [ ] To apply and create infrastructure
```
terraform apply
```
