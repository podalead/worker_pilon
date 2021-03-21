output "pilon_private_key" {
  value = tls_private_key.pilon_keypair_generator.private_key_pem
}