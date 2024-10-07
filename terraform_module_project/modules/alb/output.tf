output "load_balancer_arn" {
    value       = aws_lb.load_balancer.arn
}

output "target_group_arn" {
    value       = aws_lb_target_group.TG.arn
  
}
output "load_balancer_dns" {
    value = aws_lb.load_balancer.dns_name
  
}