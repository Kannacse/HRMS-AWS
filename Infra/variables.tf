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
