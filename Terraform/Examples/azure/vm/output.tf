output "terraform-vm-pub-ip" {
  description = "Public IP to access the new VM"
  value       = azurerm_linux_virtual_machine.az-vm-ubuntu.public_ip_address
}