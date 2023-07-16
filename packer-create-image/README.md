# Packer

## Packer part of the training.

Here we built an AMI starting from a base Ubuntu image. We install Solr on it and add a few config files.

Files here:

* solr_9.2.1.pkr.hcl  -> Packer creates an AMI which has Solr 9.2.1 installed
* install-solr.sh     -> Packer uses this script to install Solr on base Ubuntu AMI
* terraform-create-ec2-using-packer-image.tf -> Creates an EC2 instance using the AMI we built with Packer
* ansible-copy-configs -> After ec2 instance is running, this can upload custom Solr schemas to it. Packer could have done this too and put the custom configs on the AMI, but packer can't use jinja2 templates to template config files.
