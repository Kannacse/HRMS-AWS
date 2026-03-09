module "vpc" {
  source = "./modules/vpc"
  region = var.region
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source    = "./modules/IAM"
  role_name = "${local.name}-ec2-role"
}

module "alb" {
  source         = "./modules/alb"
  name           = "${local.name}-alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  alb_sg         = module.security.alb_sg
}

module "asg" {
  source            = "./modules/asg"
  name              = "${local.name}-asg"
  instance_type     = var.instance_type
  public_subnets    = module.vpc.public_subnets
  ec2_sg            = module.security.ec2_sg
  target_group_arn  = module.alb.target_group_arn
}


module "rds" {
  source          = "./modules/rds"
  name            = "${local.name}-db"
  db_username     = var.db_username
  db_password     = var.db_password
  rds_sg          = module.security.rds_sg
  private_subnets = module.vpc.private_subnets
}

module "s3" {
  source      = "./modules/S3"
  bucket_name = "${local.name}-alb-logs-803232637504"
}

module "waf" {
  source = "./modules/WAF"
  name   = "${local.name}-waf"
}


module "monitoring" {
  source   = "./modules/Monitoring"
  name     = local.name
  asg_name = module.asg.asg_name
}

resource "aws_wafv2_web_acl_association" "alb_assoc" {
  resource_arn = module.alb.alb_arn
  web_acl_arn  = module.waf.web_acl_arn
}

