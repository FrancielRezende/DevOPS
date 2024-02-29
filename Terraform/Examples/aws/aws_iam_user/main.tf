provider "aws" {
  region = var.region
}
resource "aws_iam_user" "test-user" {
  name = "francieltest"
  tags = {
    Description = "Test user created from terraform"
  }
}
resource "aws_iam_policy" "test-policy" {
  name   = "test"
  policy = file("admin-policy.json")
#   policy = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement":[
#         {
#             "Effect": "Allow",
#             "Action": "*",
#             "Resource": "*"
#         }
#     ]
# }
#   EOF
}
resource "aws_iam_user_policy_attachment" "test-give-access" {
  user = aws_iam_user.test-user.name
  policy_arn = aws_iam_policy.test-policy.arn
}