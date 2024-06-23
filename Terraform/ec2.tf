provider "aws" {
    region = "us-west-1"
}

resource "aws_instance" "Demo_instance" {
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
    user_data = <<-EOF
                #!/bin/bash
                yum install httpd -y
                systemctl start httpd
                systemctl enable httpd
                EOF
    tags = {
        env = "dev"
    }
}