resource "aws_ec2_transit_gateway_vpc_attachment" "TGWA" {
  subnet_ids         = [aws_subnet.private-ap-east-1a.id, aws_subnet.private-ap-east-1b.id]
  transit_gateway_id = aws_ec2_transit_gateway.HongKong-TGW.id
  vpc_id             = aws_vpc.hungry-wolves-HongKong.id
}