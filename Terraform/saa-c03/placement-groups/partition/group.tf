resource "aws_placement_group" "aws-pg-cluster" {
  name            = var.aws_pg_name
  strategy        = var.strategy # Options: cluster, spread, partition
  partition_count = var.partition_count
}