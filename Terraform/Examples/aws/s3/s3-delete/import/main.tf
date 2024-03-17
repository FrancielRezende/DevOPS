terraform {
  required_version = ">= 1.7.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.tags
  }
}
resource "aws_s3_bucket" "s3" {
  bucket = var.aws_bucket_name
  tags   = var.tags
  force_destroy = true
}