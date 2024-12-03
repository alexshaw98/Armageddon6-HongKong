resource "aws_lb_target_group" "HungryWolves-TG-80" {
  name     = "HungryWolves-TG-80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.hungry-wolves-HongKong.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "HungryWolves-TG-80"
    Service     = "Target Group 80"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }
}

resource "aws_lb_target_group" "HungryWolves-TG-443" {
  name     = "HungryWolves-TG-443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.hungry-wolves-HongKong.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "HungryWolves-TG-443"
    Service     = "Target Group 443"
    Owner       = "alex"
    Team        = "HungryWolves"
    Assignment  = "Armageddon"
  }
}