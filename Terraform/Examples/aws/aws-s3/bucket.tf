resource "aws_s3_bucket" "bucket" {
  bucket = "franciel-03112024-bucket"
  tags   = var.tags
}
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}