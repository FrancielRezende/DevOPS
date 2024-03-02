resource "aws_instance" "ruby" {
  ami           = var.ami
  instance_type = var.instance_type
  for_each      = var.name
  key_name      = var.key_name
  tags = {
    Name = each.value
  }
}
resource "aws_instance" "jade-mw" {
  ami           = "ami-082b3eca746b12a89"
  instance_type = "t2.large"
  key_name      = "jade"
  tags = {
    "Name" : "jade-mw"
  }
}
output "instances" {
  value = aws_instance.ruby
}