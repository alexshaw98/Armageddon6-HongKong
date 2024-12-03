resource "aws_security_group" "HongKong-SG01-TG01-80" {
  name        = "HongKong-SG01-TG01-80"
  description = "HongKong-SG01-TG01-80"
  vpc_id      = aws_vpc.hungry-wolves-HongKong.id

  ingress {
    description = "Allow all traffic from VPC"
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
    Name        = "HongKong-SG01-TG01-80"
    Service     = "HongKong-80"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
    }
}

resource "aws_security_group" "HongKong-SG01-LB01" {
  name        = "HongKong-SG01-LB01"
  description = "HongKong-SG01-LB01"
  vpc_id      = aws_vpc.hungry-wolves-HongKong.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
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
    Name        = "HongKong-SG01-LB01"
    Service     = "HongKong-443"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }

}

resource "aws_security_group" "HongKong-SG01-TG02-443" {
  name        = "HongKong-SG01-TG01-443"
  description = "HongKong-SG01-TG01-443"
  vpc_id      = aws_vpc.hungry-wolves-HongKong.id

  ingress {
    description = "Allow all traffic from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "MyHomePage"
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
    Name        = "HongKong-SG01-TG01-443"
    Service     = "HongKong-443"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
    }
}