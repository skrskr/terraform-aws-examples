# # Create a security group for the EC2 instances
resource "aws_security_group" "ec2_prod" {
  name_prefix = "ec2_prod"
  vpc_id      = aws_vpc.prod.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# Create a new Elastic IP
resource "aws_eip" "eip" {
  vpc = true
}


# # Create the EC2 instances in the public subnet
resource "aws_instance" "ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  key_name      = var.ec2_key_pair_name
  subnet_id     = aws_subnet.prod_public_1.id
  vpc_security_group_ids = [
    aws_security_group.ec2_prod.id
  ]

  tags = {
    Name = "${var.project_name} EC2 ${var.environment}"
  }


#   connection {
#     type        = "ssh"
#     user        = "ec2-user"
#     private_key = file("/path/to/example-keypair.pem")
#     host        = self.public_ip
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "sudo yum install -y httpd",
#       "sudo systemctl start httpd",
#       "sudo systemctl enable httpd",
#       "echo '<html><body><h1>Hello World!</h1></body></html>' | sudo tee /var/www/html/index.html"
#     ]
#   }
}


#Associate EIP with EC2 Instance
resource "aws_eip_association" "ec2-eip-association" {
  instance_id   = aws_instance.ec2.id
  allocation_id = aws_eip.eip.id
}
