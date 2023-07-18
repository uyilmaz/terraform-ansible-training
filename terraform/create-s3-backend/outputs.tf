output "tf-s3-backend-bucket-id" {
    description = "Bucket id of the created s3 bucket. Use this as the bucker name in main terraform backend declaration."
    value       = module.s3-bucket-for-tf-backend.s3_bucket_id
}

output "tf-s3-backend-bucket-arn" {
    description = "Bucket ARN of the created s3 bucket."
    value       = module.s3-bucket-for-tf-backend.s3_bucket_arn
}

output "tf-s3-backend-bucket-region" {
    description = "Bucket region of the created s3 bucket. Use same bucket region in main terraform backend declaration."
    value       = module.s3-bucket-for-tf-backend.s3_bucket_region
}
