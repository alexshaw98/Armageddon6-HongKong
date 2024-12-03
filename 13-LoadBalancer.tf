resource "aws_lb" "HungryWolves-LB01" {
  name               = "HungryWolves-LB01"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.HongKong-SG01-LB01.id]
  subnets            = [
    aws_subnet.public-ap-east-1a.id,
    aws_subnet.public-ap-east-1b.id
  ]
  enable_deletion_protection = false

  tags = {
    Name        = "HungryWolves-LB01"
    Service     = "HongKong load balancer"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.HungryWolves-LB01.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.HungryWolves-TG-80.arn
  }
}

data "aws_acm_certificate" "cert" {
  domain   = "alexandershaw.net"
  statuses = ["ISSUED"]
  most_recent = true
}


resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.HungryWolves-LB01.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
  certificate_arn   = data.aws_acm_certificate.cert.arn



  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.HungryWolves-TG-443.arn
  }
}

output "lb_dns_name" {
  value       = aws_lb.HungryWolves-LB01.dns_name
  description = "The DNS name of the App1 Load Balancer."
}