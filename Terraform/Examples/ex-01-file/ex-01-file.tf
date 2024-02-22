#EXAMPLE https://registry.terraform.io/providers/hashicorp
resource "local_file" "pet" {
    filename        = "/temp/pets.txt"
    content         = "We love pets!"
    file_permission = "0700"
}

resource "local_file" "pet_map" {
    filename        = "/temp/pets_map.txt"
    content         = var.file-content["content3"]
}
resource "local_sensitive_file" "pet-sensitive" {
    filename    = "/temp/pets-sensitive.txt"
    content     = "We love dogs!"
}

resource "random_pet" "my-pet" {
    prefix      = "Mrs"
    separator   = "."
    length      = "1"
}

resource "local_file" "pet_var" {
    filename    = var.filename
    content     = var.content
}

resource "random_pet" "my-var-pet" {
    prefix      = var.prefix
    separator   = var.separator
    length      = var.length
}

resource "random_pet" "my-list-pet" {
    prefix      = var.prefix_list[1]
    separator   = var.separator
    length      = var.length
}

# resource "random_string" "random_pwd" {
#     count       = "10"
#     length      = "15"
#     min_lower   = "2"
#     min_numeric = "2"
#     min_special = "1"
#     min_upper   = "2"
# }