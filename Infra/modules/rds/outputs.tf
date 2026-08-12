output "db_endpoint" {
  value = aws_db_instance.db.endpoint
}

output "db_port" {
  value = aws_db_instance.db.port
}

output "db_identifier" {
  value = aws_db_instance.db.identifier
}

output "db_arn" {
  value = aws_db_instance.db.arn
}
