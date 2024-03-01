resource "aws_s3_bucket" "finance" {
  bucket = "franciel-finance"
  tags = {
    description = "Created by terraform"
  }
}
resource "aws_s3_bucket_object" "finance-object" {
  content = "./main.tf"
  key     = "finance-object"
  bucket  = aws_s3_bucket.finance.id
}
data "aws_iam_group" "finance-data" {
  group_name = "finance-analysts"
}
resource "aws_s3_bucket_policy" "finance-s3-policy" {
  bucket = aws_s3_bucket.finance.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement":[
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "arn:aws:s3:::${aws_s3_bucket.finance.id}/*,
            "Principal": {
                "AWS": [
                    "${data.aws_iam_group.finance-data.arn}"
                ]
            }
        }
    ]
}
EOF
}