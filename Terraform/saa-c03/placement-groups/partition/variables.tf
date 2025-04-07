variable "tags" {
  type = map(string)
  default = {
    owner          = "franciel"
    created_by     = "terraform"
    lab            = "saa-c03"
    type           = "partition"
    used_for       = "aws-certification"
    can_be_deleted = "yes"
    cost           = "no"
  }
}
variable "aws_region" {
  default = "us-east-2"
}
variable "aws_pg_name" {
  default = "aws-pg-partition"
}
variable "strategy" {
  default = "partition"
}
variable "partition_count" {
  default = 5
}