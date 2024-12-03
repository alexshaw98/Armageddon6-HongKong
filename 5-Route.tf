resource "aws_route_table" "HongKong-private" {
  vpc_id = aws_vpc.hungry-wolves-HongKong.id
    tags = {
    Name        = "HongKong-private"
    Service     = "HongKong"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }
route {
    cidr_block = "0.0.0.0/0"               
    gateway_id = aws_nat_gateway.HongKong-NAT.id
  }

  route {
    cidr_block = "10.0.0.0/8"               
    transit_gateway_id = aws_ec2_transit_gateway.HongKong-TGW.id
  }

}


resource "aws_route_table" "HongKong-public" {
  vpc_id = aws_vpc.hungry-wolves-HongKong.id
  tags = {
    Name        = "HongKong-public"
    Service     = "HongKong"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"    
  }
route {
    cidr_block = "0.0.0.0/0"               
    gateway_id = aws_internet_gateway.HongKong-IG.id
  }
route {
    cidr_block = "10.0.0.0/8"               
    transit_gateway_id = aws_ec2_transit_gateway.HongKong-TGW.id
  }
}

resource "aws_route_table_association" "private-ap-east-1a" {
  subnet_id      = aws_subnet.private-ap-east-1a.id
  route_table_id = aws_route_table.HongKong-private.id
}

resource "aws_route_table_association" "private-ap-east-1b" {
  subnet_id      = aws_subnet.private-ap-east-1b.id
  route_table_id = aws_route_table.HongKong-private.id
}


#public
resource "aws_route_table_association" "public-ap-east-1a" {
  subnet_id      = aws_subnet.public-ap-east-1a.id
  route_table_id = aws_route_table.HongKong-public.id
}

resource "aws_route_table_association" "public-ap-east-1b" {
  subnet_id      = aws_subnet.public-ap-east-1b.id
  route_table_id = aws_route_table.HongKong-public.id
}