resource "aws_s3_bucket" "bucket" {
  bucket = var.aws_bucket_name
  tags   = var.tags
}
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = var.aws_versioning_configuration
  }
}