# Creating EC2 Instance

Here, using Terraform, we are creating an AWS EC2 instance with some basic firewall rules. Make use of the java and solr roles from geerlingguy

* only allow incoming SSH and Solr ports, allow all outgoing traffic
* restrict access by IP
* enable solr restart handler
* store Terraform backend on S3
