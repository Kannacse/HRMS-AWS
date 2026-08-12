output "instance_profile" {
  value = aws_iam_instance_profile.profile.name
}

output "role_name" {
  value = aws_iam_role.ec2_role.name
}

output "role_arn" {
  value = aws_iam_role.ec2_role.arn
}
