provider "aws" {
    region = "eu-west-1"
}

resource "aws_vpc" "project_vpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnet" {
    vpc_id = "aws_vpc.project_vpc"
    cidr_block = "10.0.2.0/20"
}

resource "aws_subnet" "private_subnet" {
    vpc_id = "aws_vpc.project_vpc"
    cidr_block = "10.0.16.0/20"
}

resource "aws_internet_gateway" "my_igw" {
    vpc_id = "aws_vpc.project_vpc"
}

resource "aws_route_table" "public_route" {
    vpc_id = "aws_vpc.project_vpc"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "aws_internet_gateway.my_igw"
    }
}

resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public_route
}

