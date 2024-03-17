variable "tags" {
  type = map(string)
  default = {
    owner          = "franciel"
    created_by     = "terraform"
    lab            = "terraform-from-basic-to-advanced"
    used_for       = "remote-state-repo"
    can_be_deleted = "no"
    cost           = "depends-on-the-size-of-the-files"
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
variable "az_resource_group_name" {
  type    = string
  default = "terraform-remote-state-rg"
}
variable "az_storage_account_name" {
  type    = string
  default = "terraformremotestaterepo"
}
variable "az_storage_container_name" {
  type    = string
  default = "terraform-remote-state-sc"
}
variable "az_location" {
  type    = string
  default = "East US 2"
}
variable "aws_region" {
  default = "us-east-2"
}
variable "az_container_access_type" {
  type    = string
  default = "private"
}
variable "az_versioning_enabled" {
  type    = bool
  default = true
}
variable "aws_versioning_configuration" {
  type    = string
  default = "Enabled"
}
variable "aws_bucket_name" {
  type    = string
  default = "terraformremotestaterepo"
}