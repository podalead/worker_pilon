variable "key_security_params" {
  type = object({
    rsa_bits = number
    algorithm = string
  })
  default = {
    rsa_bits = 2048
    algorithm = "RSA"
  }
}

variable "aws_instance_type" {
  type = string
  default = "t3a.medium"
}

variable "additional_sg_names" {
  type = list(string)
  default = []
}

variable "aws_disk_device" {
  type = object({
    name = string
    size = number
    type = string
  })

  default = {
    name = "/dev/sda2",
    size = 20
    type = "standard"
  }
}

variable "aws_subnet_id" {
  type = string
}

variable "aws_ami" {
  type = object({
    owner_id = string
    name = string
  })
}

variable "pilon_role_policies_arns" {
  type = list(string)
  default = []
  description = "All additional arns what you need to attach to the pilon"
}

variable "tags" {
  type = object({
    Owner = string
    Product = string
    Sub_product = string
    Environment = string
    Resource_type = string
  })

  description = "Default values to bootstrap names for resources and add it to the resources"
}

variable "additional_tags" {
  type = object({})
  default = {}
  description = "Additional tags for resources"
}