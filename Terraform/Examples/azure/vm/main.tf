terraform {
  required_version = ">= 1.7.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.95.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "franciel-rg"
    storage_account_name = "francielremotestaterepo"
    container_name       = "franciel-sc"
    key                  = "azure-vm/terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
}
data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "franciel-rg"
    storage_account_name = "francielremotestaterepo"
    container_name       = "franciel-sc"
    key                  = "azure-vnet/terraform.tfstate"
  }
}