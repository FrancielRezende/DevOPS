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
variable "aws_region" {
  default = "us-east-2"
}
variable "aws_versioning_configuration" {
  type    = string
  default = "Enabled"
}
variable "aws_bucket_name" {
  type    = string
  default = "francieltempbs3"
}