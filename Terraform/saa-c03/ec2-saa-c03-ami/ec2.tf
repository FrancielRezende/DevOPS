resource "aws_instance" "aws-ec2" {
  ami                         = var.aws_ec2_ami_amazon_linux_2
  instance_type               = var.aws_ec2_type
  key_name                    = aws_key_pair.aws-ec2-key.key_name
  associate_public_ip_address = var.aws_ec2_pub_ip
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  hibernation                 = var.aws_ec2_hibernation
  tags = {
    Name = var.aws_ec2_name
  }
  # This write the IP address to a local file
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ip.txt"
  }
  instance_market_options {
    market_type = "spot"

    # Optional: Define what happens if the instance is interrupted
    spot_options {
      instance_interruption_behavior = "terminate" # Options: terminate, stop, or hibernate
      max_price                      = "0.02"      # Max hourly price you're willing to pay
    }
  }
  # This ensures Terraform applies the security group first
  depends_on = [aws_security_group.web_sg]
}
resource "aws_security_group" "web_sg" {
  name        = var.aws_security_group_name
  description = var.aws_security_group_description

  # Allow HTTP traffic from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow SSH access (optional, for management)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic (default behavior)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}