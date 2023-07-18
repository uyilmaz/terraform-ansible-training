variable "use_ami_id" {
  type = string
  #default = "ami-0320476aa0eccb88c" # Our custom AMI created by packer
  default     = "ami-0373268fb2dac8b4b" # Ubuntu 22.04 LTS	amd64	hvm:ebs-ssd	20230711
  description = "AMI id to use when creating the ec2 instance"
}

variable "public_ssh_key_path" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "path to the public ssh key to use with the ec2 instance"
}

variable "allow_ssh_access_from" {
  type        = list(string)
  nullable    = false
  description = "cidr block from where the ssh access will be allowed"
}

variable "allow_solr_access_from" {
  type        = list(string)
  nullable    = false
  description = "cidr block from where the Solr access will be allowed"
}