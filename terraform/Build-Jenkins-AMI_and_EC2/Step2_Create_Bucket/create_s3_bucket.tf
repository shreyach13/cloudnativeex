provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "shreya-terraform-bucket" {
  bucket = var.bucket_name
  region = "us-east-1"
  tags = {
    Name  = var.name_tag
    Owner = var.owner_tag
  }
}
