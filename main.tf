# configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# create an EC2 instance
resource "aws_instance" "web" {
  # AMI ID for Centos 7 x86_64 https://wiki.centos.org/Cloud/AWS
  # version 1801_01
  ami = "ami-4bf3d731"

  instance_type = "t2.micro"
  key_name      = "aws-peregin"

  tags {
    Name = "web-infra"
  }
}
