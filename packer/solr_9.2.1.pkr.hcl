packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.6"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "ami_prefix" {
  type    = string
  default = "learn-packer-linux-aws-solr-"
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "solr-9-2" {
  ami_name      = "${var.ami_prefix}-${local.timestamp}"
  instance_type = "t2.micro"
  region        = "eu-central-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu-2204-standard-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
      architecture        = "x86_64"
    }
    most_recent = true
    owners      = ["483285841698"]
  }
  ssh_username = "ubuntu"
}

build {
  name    = "learn-packer-solr-aws-build"
  sources = [
    "source.amazon-ebs.solr-9-2"
  ]
  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    script = "install-solr.sh"
  }
}
