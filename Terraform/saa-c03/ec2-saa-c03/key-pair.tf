resource "aws_key_pair" "aws-ec2-key" {
  key_name   = var.aws_key_pair_name       # Replace with your desired key name
  public_key = file(var.aws_key_pair_file) # Path to your existing public key
}
