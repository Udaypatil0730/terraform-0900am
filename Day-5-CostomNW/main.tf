# creating VPC
resource "aws_vpc" "prod" {
cidr_block = "10.0.0.0/16"
tags = {
  name = "prod_vpc"
}
}

# creating subnet
resource "aws_subnet" "prod" {
    vpc_id = aws_vpc.prod.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-south-1b"
    tags = {
      name = "public_subnet"
    }
  
}
resource "aws_subnet" "dev" {
  vpc_id = aws_vpc.prod.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "provate_subnet"
  }
}

# create internet getway

resource "aws_internet_gateway" "prod" {
    vpc_id = aws_vpc.prod.id
    tags = {
        name = "prod_ig"
    }
}

resource "aws_route_table" "Public_RT" {
    vpc_id = aws_vpc.prod.id

    route {
      gateway_id = aws_internet_gateway.prod.id
      cidr_block =  "0.0.0.0/0" 
    }
  
}
# subnet assosiation 
resource "aws_route_table_association" "name" {
    route_table_id = aws_route_table.Public_RT.id
    subnet_id = aws_subnet.dev.id
  
}

# creating security group

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.prod.id

  ingress {
    description = "TLS from ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
    description = "TLS from http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
# server creation 
resource "aws_instance" "prod" {
    ami = "ami-0ddfba243cbee3768"
    availability_zone = "ap-south-1b"
    instance_type = "t2.micro"
    key_name = "2301"
    subnet_id = aws_subnet.prod.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    tags = {
    Name = "testing"
    }
}
