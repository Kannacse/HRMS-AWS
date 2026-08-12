###############################################
# Application Load Balancer
###############################################

resource "aws_lb" "this" {

  name               = var.name
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    var.alb_sg
  ]

  subnets = var.public_subnets

  enable_deletion_protection = var.enable_deletion_protection

  idle_timeout = var.idle_timeout

  tags = {

    Name = var.name

    Component = "ALB"

    Project = "HRMS"

  }

}

###############################################
# Target Group
###############################################

resource "aws_lb_target_group" "tg" {

  name = "${var.name}-tg"

  port = 3000

  protocol = "HTTP"

  target_type = "instance"

  vpc_id = var.vpc_id

  health_check {

    enabled = true

    path = "/"

    protocol = "HTTP"

    matcher = "200-399"

    interval = 30

    timeout = 5

    healthy_threshold = 2

    unhealthy_threshold = 2

  }

  tags = {

    Name = "${var.name}-tg"

    Project = "HRMS"

  }

}

###############################################
# HTTP Listener
###############################################

resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.this.arn

  port = 80

  protocol = "HTTP"

  default_action {

    type = "forward"

    target_group_arn = aws_lb_target_group.tg.arn

  }

}
