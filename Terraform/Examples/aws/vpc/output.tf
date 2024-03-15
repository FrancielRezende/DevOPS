output "terraform-subnet-id" {
  description = "Subnet ID from terrafor-subnet"
  value       = aws_subnet.terraform-subnet.id
}
output "terraform-security-group-id" {
  description = "Security group ID from terraform-sg"
  value       = aws_security_group.terraform-sg.id
}