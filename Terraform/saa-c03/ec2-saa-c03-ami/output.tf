output "aws_ec2_pub_ip" {
  description = "Public IP to access the new EC2"
  value       = aws_instance.aws-ec2.public_ip
}