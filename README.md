# Amazon Web Services Relational Database Cloud Provisioning
- This project is designed to provision a mysql engine RDS database on AWS using terraform.

## Setup
- First ensure terraform is installed on your machine.
- Next ensure aws cli is also installed on your machine.
- Navigate into AWS console to IAM and create a new terraform user with admin priveliges. 
- Grant programmatic access to terraform user (copy and paste access key + secret key to your machine).
- Run ```aws configure``` and input keys from previous step.
- Verify terraform user can make aws cli calls.
- Check in aws provider file for terraform.
- run ```terraform init``` to download aws plugins for terraform to use.
- code out rds configurations
- add a secrets.tfvars file to mask sensitive values
- run ```terraform fmt``` 
- then run ```terraform validate```
- then run ```terraform plan --var-file="secrets.tfvars"```
- after run ```terraform apply --var-file="secrets.tfvars"```

