resource "tls_private_key" "private_key" {
  algorithm   = "RSA"
  rsa_bits    = 2048
  ecdsa_curve = "P384"
}
resource "local_file" "key_data" {
  filename        = "./private_key.pem"
  content         = tls_private_key.private_key.private_key_pem
  file_permission = "0400"
}
resource "tls_cert_request" "csr" {
  private_key_pem = tls_private_key.private_key.private_key_pem
  #You cannot create a file and read it back in the same Terrafrom code, that is not supported by Terraform.
  #private_key_pem = file("./private_key.pem")
  depends_on = [local_file.key_data]

  subject {
    common_name  = "flexit.com"
    organization = "FlexIT Consulting Services"
  }
}
