terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.7"
    }
  }
  backend "s3" {
    bucket = "s3-bucket-for-tf-backend" #it seems we can't use variables here?
    key    = "terraform-solr-state"
    region = "eu-central-1"
  }
}

provider "aws" {}

data "aws_vpc" "default" {
  default = true
}

module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.2.1"

  ami                         = var.use_ami_id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  name                        = "ec2-ubuntu"
  key_name                    = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids = [aws_security_group.allow-ssh-and-solr.id]
}

resource "aws_security_group" "allow-ssh-and-solr" {
  name        = "allow_ssh_and_solr"
  description = "Allow SSH inbound traffic and open Solr port to outside. Allow all outbound traffic."
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allow_ssh_access_from
  }

  ingress {
    description = "allow solr"
    from_port   = 8983
    to_port     = 8983
    protocol    = "tcp"
    cidr_blocks = var.allow_solr_access_from
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  timeouts {
    delete = "2m"
  }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh_key"
  public_key = file(var.public_ssh_key_path) # file("~/.ssh/id_rsa.pub")
}
