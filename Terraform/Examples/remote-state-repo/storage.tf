resource "azurerm_resource_group" "terraform-rg" {
  name     = var.az_resource_group_name
  location = var.az_location
  tags     = var.tags
}
resource "azurerm_storage_account" "terraform-sa" {
  name                     = var.az_storage_account_name
  resource_group_name      = azurerm_resource_group.terraform-rg.name
  location                 = azurerm_resource_group.terraform-rg.location
  account_tier             = var.az_account_tier
  account_replication_type = var.az_account_replication_type
  blob_properties {
    versioning_enabled = var.az_versioning_enabled
  }
  tags = var.tags
}
resource "azurerm_storage_container" "terraform-sc" {
  name                  = var.az_storage_container_name
  storage_account_name  = azurerm_storage_account.terraform-sa.name
  container_access_type = var.az_container_access_type
}