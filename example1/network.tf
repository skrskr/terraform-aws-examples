# Production VPC
resource "aws_vpc" "prod" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name} vpc ${var.environment}"
  }
}

# Public Subnets
resource "aws_subnet" "prod_public_1" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.prod.id

  tags = {
    Name = "${var.project_name} public 1 ${var.environment}"
  }
}

# Private Subnets
resource "aws_subnet" "prod_private_1" {
  cidr_block = "10.0.3.0/24"
  vpc_id = aws_vpc.prod.id

  tags = {
    Name = "${var.project_name} private 1 ${var.environment}"
  }
}

# Route tables and association with the subnets
# Public route table and associations
resource "aws_route_table" "prod_public" {
  vpc_id = aws_vpc.prod.id
}

resource "aws_route_table_association" "prod_public_1" {
  route_table_id = aws_route_table.prod_public.id
  subnet_id      = aws_subnet.prod_public_1.id
}

# Private route table and associations
resource "aws_route_table" "prod_private" {
  vpc_id = aws_vpc.prod.id
}

resource "aws_route_table_association" "prod_private_1" {
  route_table_id = aws_route_table.prod_private.id
  subnet_id      = aws_subnet.prod_private_1.id
}

# Internet Gateway for the public subnet
resource "aws_internet_gateway" "prod" {
  vpc_id = aws_vpc.prod.id
}

resource "aws_route" "prod_internet_gateway" {
  route_table_id         = aws_route_table.prod_public.id
  gateway_id             = aws_internet_gateway.prod.id
  destination_cidr_block = "0.0.0.0/0"
}

# vpc
# private , public subnet
# internet gatway for public subnet
# route table
# route assocaiotn for route table
# route to connect intern gatway with public subnet
# pubclic subnet -> ec2 instance -> eip
# private subnet -> rds instance
# s3 bucket