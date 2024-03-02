variable "region" {
    default = "ca-central-1"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "ami" {
    type = map()
    default = {
        "ProjectA" = "",
        "ProjectB" = ""
    }
}