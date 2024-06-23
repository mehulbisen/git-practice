provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "project" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.project.id
  cidr_block        = "10.0.1.0/24"
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.project.id
  cidr_block        = "10.0.2.0/24"
}

resource "aws_internet_gateway" "my-gw" {
  vpc_id = aws_vpc.project.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.project.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-gw.id
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}
