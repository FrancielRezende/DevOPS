terraform {
  required_version = ">= 1.7.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
  }
  backend "s3" {
    bucket = "francielremotestaterepo"
    key    = "aws-ec2/terraform.tfstate"
    region = "us-east-2"
  }
}
provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.tags
  }
}
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "francielremotestaterepo"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-2"
  }
}