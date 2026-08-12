variable "name" {
  description = "Application Load Balancer Name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnets" {
  description = "Public Subnet IDs"
  type        = list(string)
}

variable "alb_sg" {
  description = "ALB Security Group"
  type        = string
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}

variable "idle_timeout" {
  description = "ALB idle timeout"
  type        = number
  default     = 60
}
