#Public subnets
resource "aws_subnet" "public-ap-east-1a" {
  vpc_id                  = aws_vpc.hungry-wolves-HongKong.id
  cidr_block              = "10.81.1.0/24"
  availability_zone       = "ap-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name        = "public-ap-east-1a"
    Service     = "HongKong"
    Owner       = "alex"
    Assignment  = "Armageddon"
  }
}

resource "aws_subnet" "public-ap-east-1b" {
  vpc_id                  = aws_vpc.hungry-wolves-HongKong.id
  cidr_block              = "10.81.2.0/24"
  availability_zone       = "ap-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name        = "public-ap-east-1b"
    Service     = "HongKong"
    Owner       = "alex"
    Assignment  = "Armageddon"
  }
}


#Private subnets
resource "aws_subnet" "private-ap-east-1a" {
  vpc_id            = aws_vpc.hungry-wolves-HongKong.id
  cidr_block        = "10.81.11.0/24"
  availability_zone = "ap-east-1a"

  tags = {
    Name        = "private-ap-east-1a"
    Service     = "HongKong"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }
}

resource "aws_subnet" "private-ap-east-1b" {
  vpc_id            = aws_vpc.hungry-wolves-HongKong.id
  cidr_block        = "10.81.12.0/24"
  availability_zone = "ap-east-1b"

  tags = {
    Name        = "private-ap-east-1b"
    Service     = "HongKong"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }
}