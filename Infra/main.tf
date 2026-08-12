
module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source    = "./modules/iam"
  role_name = "${local.name}-ec2-role"
}

module "alb" {
  source = "./modules/alb"

  name = "${local.name}-alb"

  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  alb_sg         = module.security.alb_sg

  enable_deletion_protection = false
  idle_timeout               = 60
}

module "asg" {
  source           = "./modules/asg"
  name             = "${local.name}-asg"
  instance_type    = var.instance_type
  public_subnets   = module.vpc.public_subnets
  ec2_sg           = module.security.ec2_sg
  target_group_arn = module.alb.target_group_arn
  key_name         = var.key_name
}

module "rds" {

  source = "./modules/rds"

  name = "${local.name}-db"

  db_username = var.db_username
  db_password = var.db_password
  db_name     = var.db_name

  rds_sg = module.security.rds_sg

  private_subnets = module.vpc.private_subnets

  instance_class = "db.t3.micro"

  allocated_storage = 20

  backup_retention_period = 7

  multi_az = false

  deletion_protection = false

}

module "s3" {

  source = "./modules/s3"

  bucket_name = "${local.name}-logs"

  enable_versioning = true

}

module "waf" {
  source = "./modules/waf"
  name   = "${local.name}-waf"
}

module "monitoring" {

  source = "./modules/monitoring"

  name = local.name

  asg_name = module.asg.asg_name

}

resource "aws_wafv2_web_acl_association" "alb_assoc" {
  resource_arn = module.alb.alb_arn
  web_acl_arn  = module.waf.web_acl_arn
}

module "vpc" {

  source = "./modules/vpc"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr = var.vpc_cidr

  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr

  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr

  az1 = var.az1
  az2 = var.az2

}
