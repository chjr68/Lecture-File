resource "aws_security_group" "slavery-securitygroup" {
  vpc_id = aws_vpc.main.id
  name = "slavery-securitygroup"
  description = "security group for my instance"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      security_groups = [aws_security_group.slavery-elb-securitygroup.id]
  }

  tags = {
    Name = "slavery-securitygroup"
  }
}
resource "aws_security_group" "slavery-elb-securitygroup" {
  vpc_id = aws_vpc.main.id
  name = "elb"
  description = "security group for load balancer"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "elb"
  }
}
