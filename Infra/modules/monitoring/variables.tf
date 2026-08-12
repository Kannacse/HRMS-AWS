variable "name" {
  description = "Project name"
  type        = string
}

variable "asg_name" {
  description = "Auto Scaling Group name"
  type        = string
}

variable "cpu_threshold" {
  description = "CPU threshold percentage"
  type        = number
  default     = 80
}
