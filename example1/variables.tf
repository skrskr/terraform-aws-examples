variable "region" {
  description = "The AWS region to create resources in."
  default     = "us-east-2"
}

variable "project_name" {
  description = "Project name to use in resource names"
  default     = "test"
}

variable "environment" {
  description = "Environment prod, staging, testing"
  default     = "prod"
}


# Ec2 variables
variable "ec2_ami" {
  description = "Ec2 ami"
  default     = "ami-0c55b159cbfafe1f0"
}

variable "ec2_instance_type" {
  description = "Ec2 instance type"
  default     = "t2.micro"
}

variable "ec2_key_pair_name" {
  description = "Ec2 key pair name"
  default     = "demo-key-pair"
}

# S3

variable "prod_media_bucket" {
  description = "S3 Bucket for production media files"
  default = "prod-media-2555ff5"
}