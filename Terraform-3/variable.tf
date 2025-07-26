variable "region" {
    description = "region_for_resources"
    type = string
    default = "ap-south-1"
}

variable "cidr_block" {
    description = "cridr_for_vpc"
    type = string
    default = "10.0.0.0/16"
}

variable "availability_zone" {
    description = "avaibility_zone_for_subnet"
    type = string
    default = "ap-south-1a"
}

variable "subnet_cidr" {
    description = "cidr_for_subnet"
    type = string
    default = "10.0.1.0/24"
}

variable "ami_id" {
    description = "ami_id_for_instance"
    type = string
    default = "ami-0d0ad8bb301edb745"
}

variable "key_name" {
    description = "key_pair_for_instance"
    type = string
    default = "demo_key"
  
}

variable "instance_type" {
    description = "type_of_instance"
    type = string
    default = "t2.micro"
  
}
