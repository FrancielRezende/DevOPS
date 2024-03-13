variable "region" {
  default = "us-east-2"
}
variable "tags" {
  type = map(string)
  default = {
    owner          = "franciel"
    created_by     = "terraform"
    lab            = "terraform-from-basic-to-advanced"
    can_be_deleted = "yes"
  }
}