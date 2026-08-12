#############################
# VPC
#############################

resource "aws_vpc" "this" {

  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-${var.environment}-vpc"
  }

}

#############################
# Internet Gateway
#############################

resource "aws_internet_gateway" "this" {

  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.project_name}-igw"
  }

}

#############################
# Public Subnet 1
#############################

resource "aws_subnet" "public1" {

  vpc_id = aws_vpc.this.id

  cidr_block = var.public_subnet_1_cidr

  availability_zone = var.az1

  map_public_ip_on_launch = true

  tags = {

    Name = "${var.project_name}-public-1"

  }

}

#############################
# Public Subnet 2
#############################

resource "aws_subnet" "public2" {

  vpc_id = aws_vpc.this.id

  cidr_block = var.public_subnet_2_cidr

  availability_zone = var.az2

  map_public_ip_on_launch = true

  tags = {

    Name = "${var.project_name}-public-2"

  }

}

#############################
# Private Subnet 1
#############################

resource "aws_subnet" "private1" {

  vpc_id = aws_vpc.this.id

  cidr_block = var.private_subnet_1_cidr

  availability_zone = var.az1

  tags = {

    Name = "${var.project_name}-private-1"

  }

}

#############################
# Private Subnet 2
#############################

resource "aws_subnet" "private2" {

  vpc_id = aws_vpc.this.id

  cidr_block = var.private_subnet_2_cidr

  availability_zone = var.az2

  tags = {

    Name = "${var.project_name}-private-2"

  }

}

#############################
# Public Route Table
#############################

resource "aws_route_table" "public" {

  vpc_id = aws_vpc.this.id

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.this.id

  }

}

#############################
# Route Association
#############################

resource "aws_route_table_association" "public1" {

  subnet_id = aws_subnet.public1.id

  route_table_id = aws_route_table.public.id

}

resource "aws_route_table_association" "public2" {

  subnet_id = aws_subnet.public2.id

  route_table_id = aws_route_table.public.id

}

#############################
# Database Subnet Group
#############################

resource "aws_db_subnet_group" "this" {

  name = "${var.project_name}-db-subnet"

  subnet_ids = [

    aws_subnet.private1.id,
    aws_subnet.private2.id

  ]

  tags = {

    Name = "${var.project_name}-db-subnet"

  }

}
