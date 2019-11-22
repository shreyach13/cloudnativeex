# Create a S3 Bucket in AWS using Terraform

This bucket will be used to store the terraform state file of our EC2 instance, which will be created in Step 3.

## Step 2

- [ ] Git pull the code of Step 2
- [ ] Read the terraform code in the "create_s3_bucket.tf" file to understand what we are trying to achieve
- [ ] Change the name of the s3 bucket as the s3 bucket names are unique. If you are getting error in naming the s3 bucket, 
check for the s3 bucket naming convention. The change should be made in the variable.tf file.
- [ ] Initialise your terraform in the terminal 
```
terraform init
```

- [ ] Validate your terraform file
```
terraform validate
```

- [ ] Check the terraform plan
```
terraform plan
```

- [ ] Apply the terraform configuration
```
terraform apply
```

- [ ] Log in to your AWS Console to check if bucket is created

- [ ] Running this code will also create a terraform state file which will contain information regarding the resources.
Have a look in the state file to understand its functionality better.
