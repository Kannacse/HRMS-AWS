data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }
}

resource "aws_launch_template" "lt" {
  name_prefix   = var.name
  image_id      = data.aws_ami.amazon.id
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = base64encode(file("${path.module}/../../bootstrap/bootstrap.sh"))

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.ec2_sg]
  }
}

resource "aws_autoscaling_group" "asg" {
  min_size            = 0
  max_size            = 2
  desired_capacity    = 1
  vpc_zone_identifier = var.public_subnets

  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]

  lifecycle {
    ignore_changes = [desired_capacity]
  }
}
