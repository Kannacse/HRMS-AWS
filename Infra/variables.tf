variable "region" {
  default = "ap-south-2"
}

variable "environment" {
  default = "prod"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  sensitive = true
}

variable "key_name" {
  description = "EC2 Key Pair"
  type        = string
  default     = "hrms-key-hyd"
}
variable "db_name" {
  type    = string
  default = "hrms"
}

variable "project_name" {
  default = "hrms"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  default = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  default = "10.0.2.0/24"
}

variable "private_subnet_1_cidr" {
  default = "10.0.11.0/24"
}

variable "private_subnet_2_cidr" {
  default = "10.0.12.0/24"
}

variable "az1" {
  default = "ap-south-1a"
}

variable "az2" {
  default = "ap-south-1b"
}
