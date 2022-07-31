resource "aws_lb" "alb" {
  name               = "belong-coding-challenge-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public_subnet_2a.id, aws_subnet.public_subnet_2b.id, aws_subnet.public_subnet_2c.id ]
  idle_timeout       = 300

  tags = {
    Environment = var.environment
  }
}

resource "aws_security_group" "alb_sg" {
  name        = "belong-coding-challenge-alb-sg-${var.environment}"
  description = "For belong coding challenge ALB. Created by Terraform."
  vpc_id      = aws_vpc.belong_coding_challenge_vpc.id

  dynamic "ingress" {
    for_each = var.alb_ports_map_in
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"
      cidr_blocks = ingress.value
    }
  }

  dynamic "egress" {
    for_each = var.alb_ports_map_out
    content {
      from_port   = egress.key
      to_port     = egress.key
      protocol    = "All"
      cidr_blocks = egress.value
    }
  }

  tags = {
    Name = "belong-coding-challenge-alb-sg-${var.environment}"
  }
}

resource "aws_lb_target_group" "alb_tg" {
  name        = "belong-challenge-alb-tg-${var.environment}"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.belong_coding_challenge_vpc.id
  
  health_check {
    port                = "traffic-port"
    protocol            = "HTTP"
    path                = "/"
    timeout             = "5" # default=5
    interval            = "30" # defautl=30
    healthy_threshold   = "5"  # default=3
    unhealthy_threshold = "2"  # default=3
    matcher             = "200"
  }
}

resource "aws_alb_listener" "port_80" {
  depends_on = [
    aws_lb.alb,
  ]
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"
  
  # Without port 443
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }

  # For port 443
  /* default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  } */
}

/* resource "aws_lb_listener" "port_443" {
  depends_on = [
    aws_lb.alb,
    aws_lb_target_group.alb_tg,
  ]
  load_balancer_arn = aws_lb.alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-FS-1-2-Res-2020-10"
  certificate_arn   = data.aws_acm_certificate.ssl_certificate.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
} */

resource "aws_lb_target_group_attachment" "target_group_attachment" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = aws_instance.belong_coding_challenge_service_ec2_instance.id
  port             = 80
}
