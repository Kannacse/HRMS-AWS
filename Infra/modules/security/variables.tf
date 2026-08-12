variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "CIDR block allowed to SSH into EC2"
  type        = string
  default     = "0.0.0.0/0"
}
