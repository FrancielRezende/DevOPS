terraform {
  required_version = ">= 1.7.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.95.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "terraform-remote-state-rg"
    storage_account_name = "terraformremotestaterepo"
    container_name       = "terraform-remote-state-sc"
    key                  = "azure-vm-custom-data/terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
}
data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "terraform-remote-state-rg"
    storage_account_name = "terraformremotestaterepo"
    container_name       = "terraform-remote-state-sc"
    key                  = "azure-vnet/terraform.tfstate"
  }
}