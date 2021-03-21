data "aws_subnet" "instance_subnet_placement" {
  id = var.aws_subnet_id
}

data "aws_ami" "pilon_private_ami" {
  owners = var.aws_ami.owner_id
  most_recent = true

  filter {
    name = "tag:Name"
    values = [var.aws_ami.name]
  }
}