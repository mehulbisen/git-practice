provider "aws" {
    region = var.region
}

resource "aws_vpc" "my-vpc" {
    cidr_block = var.cidr_block
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.my-vpc.id
    availability_zone = var.availability_zone
    cidr_block = var.subnet_cidr
}

resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.my-vpc.id 
}

resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.my-vpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-igw.id
    }
}

resource "aws_route_table_association" "my-asso" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_security_group" "all-tcp" {
    vpc_id = aws_vpc.my-vpc.id

    ingress {
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = "0.0.0.0/0"
    }

    egress {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = "0.0.0.0/0"
    }
    
}

resource "aws_instance" "demo-server"{
    ami = var.ami_id
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.all-tcp.id]
    instance_type = var.instance_type
    subnet_id = aws_subnet.public_subnet.id

}