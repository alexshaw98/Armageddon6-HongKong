resource "aws_eip" "HongKong-NAT" {
  vpc = true

  tags = {
    Name        = "HongKong-NAT"
    Service     = "HongKong"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }
}

resource "aws_nat_gateway" "HongKong-NAT" {
  allocation_id = aws_eip.HongKong-NAT.id
  subnet_id     = aws_subnet.public-ap-east-1a.id

  tags = {
    Name        = "HongKong-NAT"
    Service     = "HongKong"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }

  depends_on = [aws_internet_gateway.HongKong-IG]
}
