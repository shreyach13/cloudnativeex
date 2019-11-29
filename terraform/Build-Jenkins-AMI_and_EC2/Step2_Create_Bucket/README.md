# Create an S3 Bucket in AWS using Terraform

This bucket will be used to store the terraform state file of our EC2 instance, which will be created in Step 3.

## Step 2

- Git pull the code of Step 2, unless you have cloned the entire repo. In the latter case, change into the `terraform/Build-Jenkins-AMI_and_EC2/Step2_Create_Bucket` folder.

- Read the terraform code in the `create_s3_bucket.tf` file to understand what we are trying to achieve.

- Change the name of the S3 bucket as S3 bucket names are unique. If you get an error in naming the S3 bucket, check for the S3 bucket naming convention. The change should be made in the v`ariable.tf` file.

- Initialise your terraform in your terminal session:
  ```
  terraform init
  ```

- Validate your terraform file:
  ```
  terraform validate
  ```

- Check the terraform plan:
  ```
  terraform plan
  ```

- Apply the terraform configuration:
  ```
  terraform apply
  ```

- Log on to your AWS Console to check if the bucket has been created.

- Running this code will also create a terraform state file which will contain information regarding the resources. Have a look at the state file to understand its functionality better.
