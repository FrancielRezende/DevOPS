resource "aws_instance" "web-server" {
  ami           = ""
  instance_type = "t2.micro"
  tags = {
    Name        = "webserver"
    Description = "Created by terraform"
  }
  user_data              = <<EOF
                sudo apt update
                sudo apt install nginx -y
                systemctl enable nginx
                systemctl start nginx
                EOF
  key_name               = aws_key_pair.web.id
  vpc_security_group_ids = [aws_security_group.ssh-access.id]
}
resource "aws_key_pair" "web" {
  public_key = file("/root/.ssh/web.pub")
}
resource "aws_security_group" "ssh-access" {
  name        = "ssh-access"
  description = "Allow SSH access form the internet"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "publicip" {
  value = aws_instance.web-server.public_ip
}