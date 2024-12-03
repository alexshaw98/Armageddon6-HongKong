resource "aws_ec2_transit_gateway" "HongKong-TGW" {
  description = "homework"
  tags = {
    Name = "HongKong-TGW"
    Service     = "HongKong"
    Owner       = "Alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"    
  }
}