resource "azurerm_resource_group" "vnet-rg" {
  name     = var.az_resource_group_name
  location = var.az_location
  tags     = local.tags
}
resource "azurerm_virtual_network" "vnet" {
  name                = var.az_virtual_network_name
  location            = var.az_location
  resource_group_name = azurerm_resource_group.vnet-rg.name
  address_space       = [var.az_vnet_addr_space]
  tags                = local.tags
}
resource "azurerm_subnet" "vnet-subnet" {
  name                 = var.az_subnet_name
  resource_group_name  = azurerm_resource_group.vnet-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.az_subnet_addr_prefix]
}
resource "azurerm_network_security_group" "nsg" {
  name                = var.az_nsg_name
  location            = var.az_location
  resource_group_name = azurerm_resource_group.vnet-rg.name
  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "189.5.164.188/32"
    destination_address_prefix = "*"
  }
  tags = local.tags
}
resource "azurerm_subnet_network_security_group_association" "subnet-nsga" {
  subnet_id                 = azurerm_subnet.vnet-subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}