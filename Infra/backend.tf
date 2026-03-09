terraform {
  backend "s3" {
    bucket         = "hrms-prod-terraform-state"
    key            = "fresh/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "hrms-terraform-lock"
    encrypt        = true
  }
}