resource "aws_internet_gateway" "HongKong-IG" {
  vpc_id = aws_vpc.hungry-wolves-HongKong.id

  tags = {
    Name        = "HongKong-IG"
    Service     = "HongKong"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }
}
