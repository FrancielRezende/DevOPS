variable "tags" {
  type = map(string)
  default = {
    owner          = "franciel"
    created_by     = "terraform"
    lab            = "saa-c03"
    used_for       = "aws-certification"
    can_be_deleted = "yes"
    personal_ami   = "yes"
    cost           = "yes"
  }
}
variable "aws_region" {
  default = "us-east-2"
}
variable "aws_key_pair_name" {
  type    = string
  default = "key_rsa"
}
variable "aws_key_pair_file" {
  type    = string
  default = "C:/Users/Franciel/Documents/AWS/key_rsa.pub"
}
variable "aws_ec2_type" {
  type    = string
  default = "t2.micro"
}
variable "aws_ec2_pub_ip" {
  type    = bool
  default = true
}
variable "aws_ec2_name" {
  type    = string
  default = "saa-c03"
}
variable "aws_ec2_ami_amazon_linux_2" {
  type    = string
  default = "ami-03fa416bb23a87b06"
}
variable "aws_security_group_name" {
  type    = string
  default = "web-server-sg"
}
variable "aws_security_group_description" {
  type    = string
  default = "Allow inbound HTTP and SSH traffic"
}
variable "aws_ec2_hibernation" {
  type    = bool
  default = false
}