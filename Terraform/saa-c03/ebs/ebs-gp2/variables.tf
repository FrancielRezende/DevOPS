variable "tags" {
  type = map(string)
  default = {
    owner          = "franciel"
    created_by     = "terraform"
    lab            = "saa-c03"
    type           = "ebs"
    used_for       = "aws-certification"
    can_be_deleted = "yes"
    cost           = "yes"
  }
}
variable "aws_region" {
  default = "us-east-2"
}
variable "ebs_size" {
  type    = number
  default = 8
}
variable "ebs_iops" {
  type    = number
  default = 3000
}
variable "ebs_type" {
  type    = string
  default = "gp3"
}
variable "ebs_region" {
  default = "us-east-2a"
}
