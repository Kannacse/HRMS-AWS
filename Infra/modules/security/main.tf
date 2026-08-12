#############################################
# ALB Security Group
#############################################

resource "aws_security_group" "alb" {

  name        = "hrms-alb-sg"
  description = "Security group for Application Load Balancer"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "hrms-alb-sg"
  }
}

#############################################
# EC2 Security Group
#############################################

resource "aws_security_group" "ec2" {

  name        = "hrms-ec2-sg"
  description = "Security group for EC2"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Traffic from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  ingress {
    description = "SSH"

    from_port = 22
    to_port   = 22

    protocol = "tcp"

    cidr_blocks = [var.ssh_allowed_cidr]
  }

  ingress {
    description = "Jenkins"

    from_port = 8080
    to_port   = 8080

    protocol = "tcp"

    cidr_blocks = [var.ssh_allowed_cidr]
  }

  ingress {
    description = "HTTPS"

    from_port = 443
    to_port   = 443

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Grafana"

    from_port = 3000
    to_port   = 3000

    protocol = "tcp"

    cidr_blocks = [var.ssh_allowed_cidr]
  }

  ingress {
    description = "Kubernetes API"

    from_port = 6443
    to_port   = 6443

    protocol = "tcp"

    cidr_blocks = [var.ssh_allowed_cidr]
  }

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "hrms-ec2-sg"
  }
}

#############################################
# RDS Security Group
#############################################

resource "aws_security_group" "rds" {

  name        = "hrms-rds-sg"
  description = "Security group for RDS"
  vpc_id      = var.vpc_id

  ingress {

    from_port = 3306
    to_port   = 3306

    protocol = "tcp"

    security_groups = [
      aws_security_group.ec2.id
    ]

  }

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }

  tags = {
    Name = "hrms-rds-sg"
  }
}
