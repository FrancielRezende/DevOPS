resource "aws_placement_group" "aws-pg-cluster" {
  name     = var.aws_pg_name
  strategy = var.strategy # Options: cluster, spread, partition
  spread_level = var.spread_level
}