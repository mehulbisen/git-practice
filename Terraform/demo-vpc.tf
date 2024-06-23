provider "aws" {
    region = "eu-west-1"
}

resource "aws_vpc" "project-vpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public-subnet" {
    vpc_id = aws_vpc.project-vpc.id
    cidr_block = "10.0.10.0/24"
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.project-vpc.id
    cidr_block = "10.0.33.0/24"
}

resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.project-vpc.id
}

resource "aws_route_table" "public-route" {
    vpc_id = aws_vpc.project-vpc.id

    route {
        cidr_block = "0.0.0.0/24"
        gateway_id = aws_internet_gateway.my-gw.id 
    }
}

resource "aws_route_table_association" "public-route" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public-route.id
}