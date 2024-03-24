resource "azurerm_resource_group" "az_resource_group" {
  name     = var.az_resource_group_name
  location = var.az_location
  tags     = local.tags
}
resource "azurerm_public_ip" "az_public_ip" {
  name                = var.az_public_ip_name
  resource_group_name = azurerm_resource_group.az_resource_group.name
  location            = var.az_location
  allocation_method   = var.az_allocation_method
  tags                = local.tags
}
resource "azurerm_network_interface" "az_net_interface" {
  name                = var.az_net_interface_name
  location            = var.az_location
  resource_group_name = azurerm_resource_group.az_resource_group.name
  ip_configuration {
    name                          = var.az_public_ip_name
    subnet_id                     = data.terraform_remote_state.vnet.outputs.terraform-subnet-id
    private_ip_address_allocation = var.az_priv_ipaddr_allocation
    public_ip_address_id          = azurerm_public_ip.az_public_ip.id
  }
  tags = local.tags
}
resource "azurerm_network_interface_security_group_association" "az_nsg_association" {
  network_interface_id      = azurerm_network_interface.az_net_interface.id
  network_security_group_id = data.terraform_remote_state.vnet.outputs.terraform-netwoek-security-group-id
}
resource "azurerm_linux_virtual_machine" "az_vm_ubuntu" {
  name                  = var.az_vm_name
  resource_group_name   = azurerm_resource_group.az_resource_group.name
  location              = var.az_location
  size                  = var.az_vm_size
  admin_username        = var.az_vm_admin
  network_interface_ids = [azurerm_network_interface.az_net_interface.id]
  custom_data = base64encode(file("./docs/docker.sh"))
  admin_ssh_key {
    username   = var.az_vm_admin
    public_key = file(var.az_vm_ssh_key_file)
  }
  os_disk {
    caching              = local.az_vm_os_disk.caching
    storage_account_type = local.az_vm_os_disk.storage
  }
  source_image_reference {
    publisher = local.az_vm_image.publisher
    offer     = local.az_vm_image.offer
    sku       = local.az_vm_image.sku
    version   = local.az_vm_image.version
  }
}