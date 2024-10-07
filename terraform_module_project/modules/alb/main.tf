resource "aws_lb" "load_balancer" {
    name = "${var.resource_name}-loadbalancer"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [var.security_group_id]
    subnets             = var.pub_subnet
    
}
resource "aws_lb_target_group" "TG" {
  name     = "${var.resource_name}-TG"
  target_type = "instance"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id


  health_check {
    enabled             = true
    interval            = 300
    path                = "/wordpress/wp-admin/install.php"
    timeout             = 60
    matcher             = 200
    healthy_threshold   = 2
    unhealthy_threshold = 5
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_lb_listener" "Listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.TG.arn
  }
  depends_on = [aws_lb.load_balancer, aws_lb_target_group.TG]
}

