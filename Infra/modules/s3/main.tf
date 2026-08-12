###############################################
# S3 Bucket
###############################################

resource "aws_s3_bucket" "logs" {

  bucket = var.bucket_name

  tags = {
    Name      = var.bucket_name
    Project   = "HRMS"
    ManagedBy = "Terraform"
  }

}

###############################################
# Versioning
###############################################

resource "aws_s3_bucket_versioning" "this" {

  bucket = aws_s3_bucket.logs.id

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }

}

###############################################
# Server-side Encryption
###############################################

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {

  bucket = aws_s3_bucket.logs.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"

    }

  }

}

###############################################
# Block Public Access
###############################################

resource "aws_s3_bucket_public_access_block" "this" {

  bucket = aws_s3_bucket.logs.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true

}

###############################################
# Lifecycle Rule
###############################################

resource "aws_s3_bucket_lifecycle_configuration" "this" {

  bucket = aws_s3_bucket.logs.id

  rule {

    id = "cleanup-old-versions"

    status = "Enabled"

    filter {}

    noncurrent_version_expiration {
      noncurrent_days = 30
    }

  }

}
