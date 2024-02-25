variable "users" {
    type = set(string)
    default = [ "/temp/user10", "/temp/user11", "/temp/user12", "/temp/user14"]
}
variable "content" {
    default = "password: S3cr3tP@ssw0rd"
  
}
variable "files" {
    default = [
        "/temp/user20",
        "/temp/user22"
    ]
}