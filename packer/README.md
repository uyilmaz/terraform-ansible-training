# Packer

## Packer part of the training

Here we built a custom AMI starting from a base Ubuntu image and install Solr on it.

Files here:

* solr_9.2.1.pkr.hcl  -> Packer creates an AMI which has Solr 9.2.1 installed
* install-solr.sh     -> Packer uses this script to install Solr on base Ubuntu AMI
