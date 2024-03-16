locals {
  tags = {
    owner          = "franciel"
    created_by     = "terraform"
    lab            = "terraform-from-basic-to-advanced"
    used_for       = "terraform-course"
    can_be_deleted = "yes"
    cost           = "yes"
  }
  az_vm_os_disk = {
    caching = "ReadWrite"
    storage = "Standard_LRS"
  }
  az_vm_image = {
    "publisher" = "Canonical"
    "offer"     = "UbuntuServer"
    "sku"       = "18.04-LTS"
    "version"   = "latest"
  }
}