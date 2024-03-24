variable "az_location" {
  type = string
  default = "East US 2"
}
variable "az_resource_group_name" {
  type    = string
  default = "terraform-vms-rg"
}
variable "az_public_ip_name" {
  type    = string
  default = "terraform-vm-pub-ip"
}
variable "az_allocation_method" {
  type    = string
  default = "Dynamic"
}
variable "az_net_interface_name" {
  type    = string
  default = "terraform-vm-net-interface"
}
variable "az_priv_ipaddr_allocation" {
  type    = string
  default = "Dynamic"
}
variable "az_vm_name" {
  type    = string
  default = "terraform-vm-ubuntu"
}
variable "az_vm_size" {
  type    = string
  default = "Standard_B1s"
}
variable "az_vm_admin" {
  type    = string
  default = "terraform"
}
variable "az_vm_ssh_key_file" {
  type    = string
  default = "./azure-key.pub"
}
variable "connection" {
  type = string
  default = "ssh"
}