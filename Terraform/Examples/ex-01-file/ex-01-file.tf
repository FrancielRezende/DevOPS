#EXAMPLE https://registry.terraform.io/providers/hashicorp
resource "local_file" "pet" {
    filename        = "/temp/pets.txt"
    content         = "We love pets!"
    file_permission = "0700"
}

resource "local_sensitive_file" "pet-sensitive" {
    filename    = "/temp/pets-sensitive.txt"
    content     = "We love dogs!"
}

resource "auth0" "auth0-test" {
  
}