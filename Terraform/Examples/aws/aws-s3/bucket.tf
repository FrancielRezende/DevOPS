resource "aws_s3_bucket" "bucket" {
  bucket = "franciel-03112024-bucket"
  tags   = var.tags
}