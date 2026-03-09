resource "aws_db_subnet_group" "this" {
  name       = "${var.name}-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "${var.name}-subnet-group"
  }
}

resource "aws_db_instance" "db" {
  identifier             = var.name
  engine                 = "mysql"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  username               = var.db_username
  password               = var.db_password
  multi_az               = false
  skip_final_snapshot    = true
  vpc_security_group_ids = [var.rds_sg]
  db_subnet_group_name   = aws_db_subnet_group.this.name
}