resource "aws_key_pair" "aws-ec2-key" {
  key_name   = var.aws_key_pair_name
  public_key = file(var.aws_key_pair_file)
}
resource "aws_instance" "aws-ec2" {
  ami                         = var.aws_ec2_ami_ubuntu
  instance_type               = var.aws_ec2_type
  key_name                    = aws_key_pair.aws-ec2-key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.terraform-subnet-id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.terraform-security-group-id]
  associate_public_ip_address = var.aws_ec2_pub_ip
  tags = {
    Name = var.aws_ec2_name
  }
  connection {
    type        = var.connection["type"]
    user        = var.connection["user"]
    private_key = file("./aws-ec2-key")
    host        = self.public_ip
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ip.txt"
  }
  provisioner "remote-exec" {
    inline = [
      "echo subnet_id: ${data.terraform_remote_state.vpc.outputs.terraform-subnet-id} >> /tmp/network_info.txt",
      "echo nsg_id: ${data.terraform_remote_state.vpc.outputs.terraform-security-group-id} >> /tmp/network_info.txt",
    ]
  }
  provisioner "file" {
    source      = "./test.txt"
    destination = "/tmp/test_file.txt"
  }
  provisioner "file" {
    content     = "I used the ami: ${self.ami}"
    destination = "/tmp/ami.txt"
  }

}