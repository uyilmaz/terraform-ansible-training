Packer part of the training. Files are:

solr_9.2.1.pkr.hcl  -> packer creates an AMI which has solr 9.2.1 installed
install-solr.sh     -> packer uses this script to install solr on base ubuntu AMI
terraform-create-ec2-using-packer-image.tf -> creates an ec2 instance using the AMI we built with packer
ansible-copy-configs -> after ec2 instance is running, this can upload custom solr schemas to it. Packer could have done this too and put the custom configs on the AMI, but packer can't use jinja2 templates to template config files.