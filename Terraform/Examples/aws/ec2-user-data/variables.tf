variable "tags" {
  type = map(string)
  default = {
    owner          = "franciel"
    created_by     = "terraform"
    lab            = "terraform-from-basic-to-advanced"
    used_for       = "terraform-course"
    can_be_deleted = "yes"
    cost           = "yes"
  }
}
variable "aws_region" {
  default = "us-east-2"
}
variable "aws_key_pair_name" {
  type    = string
  default = "aws-ec2-key"
}
variable "aws_key_pair_file" {
  type    = string
  default = "./aws-ec2-key.pub"
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
  default = "terraform-ec2"
}
variable "aws_ec2_ami_ubuntu" {
  type    = string
  default = "ami-0f5daaa3a7fb3378b"
}

variable "az_container_access_type" {
  type    = string
  default = "private"
}
variable "az_versioning_enabled" {
  type    = bool
  default = true
}
variable "aws_versioning_configuration" {
  type    = string
  default = "Enabled"
}
variable "aws_remote_state_repo" {
  type    = string
  default = "francielremotestaterepo"
}
variable "aws_s3_backend_key" {
  type    = string
  default = "aws-vpc/terraform.tfstate"
}
variable "aws_vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "aws_subnet_name" {
  type    = string
  default = "terraform-subnet"
}
variable "aws_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}
variable "aws_internet_gateway_name" {
  type    = string
  default = "terraform-ig"
}
variable "aws_route_table_name" {
  type    = string
  default = "terraform-rt"
}
variable "aws_route_table_cidr" {
  type    = string
  default = "0.0.0.0/0"
}
variable "aws_security_group_name" {
  type    = string
  default = "terraform-sg"
}
variable "aws_security_group_description" {
  type    = string
  default = "allow port 22 ssh access"
}
variable "aws_security_group_cidr" {
  type    = string
  default = "0.0.0.0/0"
}
variable "aws_security_group_ingress" {
  type = map(string)
  default = {
    description = "SSH"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = "['0.0.0.0/0']"
  }
}
variable "connection" {
  type = map(string)
  default = {
    "type" = "ssh"
    "user" = "ubuntu"
  }
}