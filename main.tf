provider "aws" {
  region                  = "us-east-1"
  access_key              = "AKIAZRYHBK4QJMZ5S34S"
  secret_key              = "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"
}

resource "aws_vpc" "main" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_support   = "1"
  enable_dns_hostnames = "1"
  tags = {
    Name = "new_myfirstvpc"
  }
}

resource "aws_subnet" "first" {
  availability_zone       = "us-east-1a"
  cidr_block              = "192.168.1.0/24"
  map_public_ip_on_launch = "1"
  vpc_id                  = aws_vpc.main.id
  tags = {
    Name = "new_myfirstsubnet"
  }
}

resource "aws_instance" "firstec2" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  key_name      = "my_ssm"
  subnet_id     = aws_subnet.first.id
  tags = {
    Name = "new_knode"
  }
}
