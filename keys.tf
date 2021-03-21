resource "tls_private_key" "pilon_keypair_generator" {
  rsa_bits = var.key_security_params.rsa_bits
  algorithm = var.key_security_params.algorithm
}

resource "aws_key_pair" "pilon_keypair_attachment" {
  key_name = local.pilon_keypair_name
  public_key = tls_private_key.pilon_keypair_generator.public_key_openssh
}