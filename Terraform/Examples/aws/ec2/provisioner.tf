resource "aws_instance" "example" {
    ami = ""
    instance_type = "t2.micro"
    provisioner "local-exec" {
        #on_failure = continue
        command = "echo Instance ${aws_instance.example.public_ip} created! > /tmp/instance_ip.txt"
    }
    provisioner "local-exec" {
        when = destroy
        command = "echo Instance ${aws_instance.example.public_ip} destroyed! > /tmp/instance_state.txt"
    }
}