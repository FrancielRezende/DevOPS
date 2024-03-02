resource "aws_instance" "mario_servers" {
     ami = var.ami
     tags = {
       Name = var.name
     }
     instance_type = var.name != "tiny" ? var.large : var.small 
}