variable "tags" {
  type = map(string)
  default = {
    owner          = "franciel"
    created_by     = "terraform"
    lab            = "terraform-from-basic-to-advanced"
    used_for       = "terraform-course"
    can_be_deleted = "no"
    cost           = "no"
  }
}
variable "az_account_replication_type" {
  type    = string
  default = "LRS"
}
variable "az_account_tier" {
  type    = string
  default = "Standard"
}
variable "az_virtual_network_name" {
  type    = string
  default = "terraform-vnet"
}
variable "az_vnet_addr_space" {
  type    = string
  default = "10.0.0.0/16"
}
variable "az_subnet_name" {
  type    = string
  default = "terraform-subnet"
}
variable "az_subnet_addr_prefix" {
  type    = string
  default = "10.0.1.0/24"
}
variable "az_resource_group_name" {
  type    = string
  default = "terraform-vnet-rg"
}
variable "az_nsg_name" {
  type    = string
  default = "terraform-nsg"
}
variable "az_location" {
  type    = string
  default = "East US 2"
}
variable "az_container_access_type" {
  type    = string
  default = "private"
}
variable "az_versioning_enabled" {
  type    = bool
  default = true
}