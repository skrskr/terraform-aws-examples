# Terraform aws examples
- This repo contains create aws resources using terraform
- Every example contains differnet infstructure with diagram

## usage
```bash
cd example1

# configure aws authentication
export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"

# init terraform project
terraform init
# show resources will be added, updated or deleted 
terraform plan
# create resources in aws
terraform apply
# destory resource
terraform destory
```
