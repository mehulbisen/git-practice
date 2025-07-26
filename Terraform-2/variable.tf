variable "region" {
    description = "AWS_region_for_resources"
    type = string
    default = "ap-south-1"
}

variable "vpc_cidr" {
    description = "cidr_block_for_vpc"
    type = string
    default = "10.0.0.0/16"
}

variable "subnet_cidr" {
    description = "cidr_for_subnet"
    type = string
    default = "10.0.1.0/24"
}

variable "avaibility_zone" {
    description = "avaibilitiy_zone_for_subnet"
    type = string
    default = "ap-south-1a"
}

variable "ami_id" {
    description = "ami_id_for_ec2"
    type = string
    default = "ami-0d0ad8bb301edb745"
}

variable "instance_type" {
    description = "instance_type"
    type = string
    default = "t2.micro"
}

variable "key_name" {
    description = "Key_pair_for_instance"
    type = string
    default = "demo_key"
}