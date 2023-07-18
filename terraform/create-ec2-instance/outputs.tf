output "ec2-instance-id" {
  value       = module.ec2-instance.id
  description = "id of the created ec2 instance"
}

output "ec2-instance-arn" {
  value       = module.ec2-instance.arn
  description = "arn of the created ec2 instance"
}

output "ec2-instance-public-ip" {
  value       = module.ec2-instance.public_ip
  description = "public ip of the running ec2 instance"
}
