###############################################
# DB Subnet Group
###############################################

resource "aws_db_subnet_group" "this" {

  name = "${var.name}-subnet-group"

  subnet_ids = var.private_subnets

  tags = {
    Name    = "${var.name}-subnet-group"
    Project = "HRMS"
  }

}

###############################################
# MySQL Database
###############################################

resource "aws_db_instance" "db" {

  identifier = var.name

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = var.instance_class

  allocated_storage = var.allocated_storage
  storage_type      = "gp3"
  storage_encrypted = true

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  multi_az = var.multi_az

  publicly_accessible = false

  backup_retention_period = var.backup_retention_period

  deletion_protection = var.deletion_protection

  skip_final_snapshot = true

  vpc_security_group_ids = [
    var.rds_sg
  ]

  db_subnet_group_name = aws_db_subnet_group.this.name

  auto_minor_version_upgrade = true

  tags = {
    Name    = var.name
    Project = "HRMS"
  }

}
