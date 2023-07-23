# Now Terraform stores the state of our infrastructure locally in the terraform.tfstate file. So, you can apply changes from your local machine only and cannot collaborate with other developers.

# The solution to these problems is a remote backend. Terraform will store terraform.tfstate file in S3 bucket.

# terraform {
#   backend "s3" {
#     bucket = "terraform-427861343"
#     key    = "terraform"
#     region = "us-east-2"
#   }

# }