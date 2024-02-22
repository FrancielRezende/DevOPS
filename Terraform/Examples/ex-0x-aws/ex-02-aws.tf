resource "aws_instance" "instance_name" {
    ami             = "ami-example"
    instance_type   = "t2.micro"
}

resource "aws_s3_bucket" "s3_name" {
    bucket  = "bucket-name"
    acl     = "private"
}