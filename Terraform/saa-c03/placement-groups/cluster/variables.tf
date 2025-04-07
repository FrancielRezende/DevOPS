variable "tags" {
  type = map(string)
  default = {
    owner          = "franciel"
    created_by     = "terraform"
    lab            = "saa-c03"
    type           = "cluster"
    used_for       = "aws-certification"
    can_be_deleted = "yes"
    cost           = "no"
  }
}
variable "aws_region" {
  default = "us-east-2"
}
variable "aws_pg_name" {
  default = "aws-pg-cluster"
}
variable "strategy" {
  default = "cluster"
}