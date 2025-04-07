variable "tags" {
  type = map(string)
  default = {
    owner          = "franciel"
    created_by     = "terraform"
    lab            = "saa-c03"
    type           = "spread"
    used_for       = "aws-certification"
    can_be_deleted = "yes"
    cost           = "no"
  }
}
variable "aws_region" {
  default = "us-east-2"
}
variable "aws_pg_name" {
  default = "aws-pg-spread"
}
variable "strategy" {
  default = "spread"
}
variable "spread_level" {
  default = "rack"
}