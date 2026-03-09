variable "name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "rds_sg" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}