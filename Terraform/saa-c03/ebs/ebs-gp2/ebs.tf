resource "aws_ebs_volume" "my_volume" {
  availability_zone = var.ebs_region # Replace with your desired AZ
  size              = var.ebs_size   # Volume size in GB
  iops              = var.ebs_iops   # Input/Output Operations Per Second
  type              = var.ebs_type   # Volume type (e.g., gp3 supports setting IOPS)
}