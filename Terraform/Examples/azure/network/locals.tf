locals {
  tags = {
    owner          = "franciel"
    created_by     = "terraform"
    lab            = "terraform-from-basic-to-advanced"
    used_for       = "terraform-course"
    can_be_deleted = "no"
    cost           = "no"
  }
  az_security_rule = {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "186.207.158.60/32"
    destination_address_prefix = "*"
  }
}