# This is the file for the Hong Kong VPC 
resource "aws_vpc" "hungry-wolves-HongKong" {
  cidr_block = "10.81.0.0/16"

  tags = {
    Name        = "hungry-wolves-HongKong"
    Service     = "HongKong"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }
}