output "alb_sg_id" {
    value = aws_security_group.alb_sg.id
  
}

output "webserver_sg_id" {
    value = aws_security_group.webserver_sg.id
  
}
output "rds_sg_id" {
    value = aws_security_group.db_sg.id 
  
}