output "alb_dns" {
  value = module.alb.alb_dns
}

output "alb_arn" {
  value = module.alb.alb_arn
}

output "rds_endpoint" {
  value = module.rds.db_endpoint
}

output "s3_bucket" {
  value = module.s3.bucket_name
}

output "asg_name" {
  value = module.asg.asg_name
}
