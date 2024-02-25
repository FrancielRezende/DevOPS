resource "local_sensitive_file" "name" {
    filename = var.files[count.index]
    content = var.content
    count = length(var.files)
}

resource "local_sensitive_file" "name_for" {
    filename = each.value
    content = var.content
    for_each = var.users
}
