resource "aws_s3_object" "upload" {
    bucket = "pixar-studios-2020"
    key = "woody.jpg"
    content = "/root/woody.jpg"
}