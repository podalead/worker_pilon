resource "aws_iam_instance_profile" "pilon_instance_profile" {
  name = local.pilon_instance_profile_name
  path = "/"
  role = aws_iam_role.pilon_common_role.name
}

resource "aws_iam_role" "pilon_common_role" {
  name = local.pilon_role_name
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": [
                  "ec2.amazonaws.com",
                  "ssm.amazonaws.com"
               ]
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF

  tags = merge(
    var.tags,
    var.additional_tags,
    {
      Name = local.pilon_role_name
    }
  )
}

resource "aws_iam_role_policy_attachment" "pilon_policies" {
  for_each = toset(var.pilon_role_policies_arns)

  role = aws_iam_role.pilon_common_role.name
  policy_arn = each.value
}