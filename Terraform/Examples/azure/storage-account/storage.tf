resource "azurerm_resource_group" "franciel-rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}
resource "azurerm_storage_account" "frnaciel-sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.franciel-rg.name
  location                 = azurerm_resource_group.franciel-rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                     = var.tags
}
resource "azurerm_storage_container" "franciel-sc" {
  name                 = var.storage_container_name
  storage_account_name = azurerm_storage_account.frnaciel-sa.name
}