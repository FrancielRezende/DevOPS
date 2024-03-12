variable "tags" {
  type = map(string)
  default = {
    owner          = "Franciel"
    created_by     = "terraform"
    lab            = "terraform-from-basic-to-advanced"
    can_be_deleted = "yes"
  }
}
variable "account_replication_type" {
  type    = string
  default = "LRS"
}
variable "account_tier" {
  type    = string
  default = "Standard"
}
variable "storage_account_name" {
  type    = string
  default = "francielsa03112024"
}
variable "resource_group_name" {
  type    = string
  default = "franciel-rg"
}
variable "storage_container_name" {
  type    = string
  default = "franciel-sc"
}
variable "location" {
  type    = string
  default = "East US 2"
}