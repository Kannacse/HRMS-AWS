variable "region" {
  default = "ap-south-1"
}

variable "environment" {
  default = "prod"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  sensitive = true
}

