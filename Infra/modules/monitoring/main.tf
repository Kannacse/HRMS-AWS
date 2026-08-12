resource "aws_cloudwatch_metric_alarm" "cpu_high" {

  alarm_name = "${var.name}-cpu-high"

  alarm_description = "Alarm when EC2 CPU utilization exceeds threshold"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  period = 300

  statistic = "Average"

  threshold = var.cpu_threshold

  dimensions = {
    AutoScalingGroupName = var.asg_name
  }

  alarm_actions = []

  ok_actions = []

  insufficient_data_actions = []

  treat_missing_data = "missing"

  tags = {
    Name    = "${var.name}-cpu-alarm"
    Project = "HRMS"
  }

}
