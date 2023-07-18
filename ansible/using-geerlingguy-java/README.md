# Ansible

This Ansible playbook uses the EC2 instance we created in Terraform tasks.
It installs Java and Solr, then copies some custom config files (schema.xml and solrconfig.xml) created using Ansible jinja2 templates.
