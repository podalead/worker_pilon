locals {
  # Example dev-frost-pilon-role
  pilon_role_name = format("%s-%s-%s-%s", var.tags.Environment, var.tags.Product, var.tags.Sub_product, "role")
  pilon_keypair_name = format("%s-%s-%s-%s", var.tags.Environment, var.tags.Product, var.tags.Sub_product, "keypair")
  pilon_instance_name = format("%s-%s-%s-%s", var.tags.Environment, var.tags.Product, var.tags.Sub_product, "ec2_instance")
  pilon_security_group_name = format("%s-%s-%s-%s", var.tags.Environment, var.tags.Product, var.tags.Sub_product, "sg")
  pilon_launch_template_name = format("%s-%s-%s-%s", var.tags.Environment, var.tags.Product, var.tags.Sub_product, "lt")
  pilon_instance_profile_name = format("%s-%s-%s-%s", var.tags.Environment, var.tags.Product, var.tags.Sub_product, "profile")

  default_policies = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
}
