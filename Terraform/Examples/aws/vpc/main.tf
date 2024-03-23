terraform {
  required_version = ">= 1.7.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.95.0"
    }
  }
  backend "s3" {
    bucket = "terraformremotestaterepo"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.tags
  }
}
resource "aws_vpc" "terraform-vpc" {
  cidr_block = var.aws_vpc_cidr
  tags = {
    Name = var.aws_vpc_name
  }
}
resource "aws_subnet" "terraform-subnet" {
  vpc_id     = aws_vpc.terraform-vpc.id
  cidr_block = var.aws_subnet_cidr
  tags = {
    Name = var.aws_subnet_name
  }
}
resource "aws_internet_gateway" "terraform-ig" {
  vpc_id = aws_vpc.terraform-vpc.id
  tags = {
    Name = var.aws_internet_gateway_name
  }
}
resource "aws_route_table" "terraform-rt" {
  vpc_id = aws_vpc.terraform-vpc.id
  route {
    cidr_block = var.aws_route_table_cidr
    gateway_id = aws_internet_gateway.terraform-ig.id
  }
  tags = {
    Name = var.aws_route_table_name
  }
}
resource "aws_route_table_association" "terraform-rta" {
  subnet_id      = aws_subnet.terraform-subnet.id
  route_table_id = aws_route_table.terraform-rt.id
}
resource "aws_security_group" "terraform-sg" {
  name        = var.aws_security_group_name
  description = var.aws_security_group_description
  vpc_id      = aws_vpc.terraform-vpc.id
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["186.207.158.60/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.aws_security_group_name
  }
}