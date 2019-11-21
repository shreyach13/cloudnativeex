terraform {
  backend "s3" {
    key = "tf-statefile/jenkins/terraform.tfstate"
  }
}
