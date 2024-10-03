


resource "aws_autoscaling_group" "asgaqeel" {
  name                      = "${var.resource_name}-autoscaling"
  desired_capacity          = 2
  max_size                  = 6
  min_size                  = 2
  health_check_type         = "ELB"
  health_check_grace_period = 300
  vpc_zone_identifier       = var.pub_subnet     
  target_group_arns = [var.target_group_arn]                                                      

  launch_template {
    id = var.aws_launch_template
  }
}

resource "aws_autoscaling_policy" "target-traacking-policy" {
  name                   = "${var.resource_name}-target-tracking"
  autoscaling_group_name = aws_autoscaling_group.asgaqeel.id
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50
  }
}