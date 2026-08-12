variable "bucket_name" {
  description = "S3 Bucket Name"
  type        = string
}

variable "enable_versioning" {
  description = "Enable S3 Versioning"
  type        = bool
  default     = true
}
