output "terraform-subnet-id" {
  description = "Subnet ID from terrafor-subnet"
  value       = azurerm_subnet.vnet-subnet.id
}
output "terraform-netwoek-security-group-id" {
  description = "Network security group ID from terraform-nsg"
  value       = azurerm_network_security_group.nsg.id
}