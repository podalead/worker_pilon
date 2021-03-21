resource "aws_launch_template" "pilon_launch_template" {
  name = local.pilon_launch_template_name
  image_id = data.aws_ami.pilon_private_ami.id
  update_default_version = true
  instance_type = var.aws_instance_type

  vpc_security_group_ids = [
    [aws_security_group.pilon_common_security_group.id],
    var.additional_sg_names
  ]

  network_interfaces {
    subnet_id = data.aws_subnet.instance_subnet_placement.id
  }

  iam_instance_profile {
    arn = aws_iam_instance_profile.pilon_instance_profile.arn
  }

  block_device_mappings {
    device_name = var.aws_disk_device.name
  }

  tags = merge(
    var.tags,
    var.additional_tags,
    {
      Name = local.pilon_launch_template_name
    }
  )
}

resource "aws_instance" "pilon_instance" {
  ami = data.aws_ami.pilon_private_ami.id
  instance_type = var.aws_instance_type
  key_name = aws_key_pair.pilon_keypair_attachment.key_name

  vpc_security_group_ids = flatten(concat(
      [aws_security_group.pilon_common_security_group.id],
      var.additional_sg_names
    ))

  associate_public_ip_address = false
  iam_instance_profile = aws_iam_instance_profile.pilon_instance_profile.name
  subnet_id = data.aws_subnet.instance_subnet_placement.id

  ebs_block_device {
    device_name = var.aws_disk_device.name
    volume_size = var.aws_disk_device.size
    volume_type = var.aws_disk_device.type
  }

  tags = merge(
    var.tags,
    var.additional_tags,
    {
      Name = local.pilon_instance_name
    }
  )
}