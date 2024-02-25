terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "!=3.17.0"
    }
  }
}

resource "aws_ebs_volume" "soft-volume" {
  availability_zone = "us-west-2a"
  size              = 15
  tags = {
    Name = "temporary"
  }
}
