resource "aws_lb_target_group" "target_group" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_autoscaling_attachment" "attachment" {
  autoscaling_group_name = var.autoscaling_group_id
  alb_target_group_arn   = aws_lb_target_group.target_group.arn
}

resource "aws_lb" "load_balancer" {
  name               = "load_balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = [var.subnet_id]
}

resource "aws_lb_listener" "my_alb_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}
