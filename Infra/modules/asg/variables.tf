variable "name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "ec2_sg" {
  type = string
}

variable "target_group_arn" {
  type = string
}