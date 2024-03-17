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
}
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.tags
  }
}

provider "azurerm" {
  features {}
}