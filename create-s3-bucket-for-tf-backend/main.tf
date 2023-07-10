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

/* 
resource "aws_s3_bucket" "s3-bucket-for-tf-backend" {
  bucket = "s3-bucket-for-tf-backend"
  force_destroy = true #allows destroying a bucket even if it contains data
} */

# this didn't work with acl set to 'private'
/* resource "aws_s3_bucket_acl" "acl-for-tf-backend" {
  bucket = aws_s3_bucket.s3-bucket-for-tf-backend.id
  acl = "private"
} */

#enables file versioning for this s3 bucket
/* resource "aws_s3_bucket_versioning" "versioning-for-tf-backend" {
  bucket = aws_s3_bucket.s3-bucket-for-tf-backend.id
  versioning_configuration {
    status = "Enabled"
  }
} */

output "tf-s3-backend-bucket-id" {
  value       = module.s3-bucket-for-tf-backend.s3_bucket_id
}

output "tf-s3-backend-bucket-arn" {
  value       = module.s3-bucket-for-tf-backend.s3_bucket_arn
}

output "tf-s3-backend-bucket-region" {
  value       = module.s3-bucket-for-tf-backend.s3_bucket_region
}