terraform {
  required_version = ">= 1.5"
  required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "~>5.7"
      }
  }
}

provider "aws" {}

module "s3-bucket-for-tf-backend" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "s3-bucket-for-tf-backend"
  acl    = "private"

  force_destroy = true

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}
