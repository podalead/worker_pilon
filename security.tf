resource "aws_security_group" "pilon_common_security_group" {
  name = local.pilon_security_group_name
  vpc_id = data.aws_subnet.instance_subnet_placement.vpc_id

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    var.additional_tags,
    {
      Name = local.pilon_security_group_name
    }
  )
}