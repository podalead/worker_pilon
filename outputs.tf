output "pilon_private_key" {
  value = tls_private_key.pilon_keypair_generator.private_key_pem
}

output "pilon_public_ip" {
  value = aws_instance.pilon_instance.public_ip
}

output "pilon_private_ip" {
  value = aws_instance.pilon_instance.private_ip
}

output "pilon_key_name" {
  value = aws_instance.pilon_instance.key_name
}