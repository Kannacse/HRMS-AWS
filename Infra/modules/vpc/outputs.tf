output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_1" {
  value = aws_subnet.public1.id
}

output "public_subnet_2" {
  value = aws_subnet.public2.id
}

output "public_subnets" {
  value = [
    aws_subnet.public1.id,
    aws_subnet.public2.id
  ]
}

output "private_subnet_1" {
  value = aws_subnet.private1.id
}

output "private_subnet_2" {
  value = aws_subnet.private2.id
}

output "private_subnets" {
  value = [
    aws_subnet.private1.id,
    aws_subnet.private2.id
  ]
}

output "database_subnet_group" {
  value = aws_db_subnet_group.this.name
}
