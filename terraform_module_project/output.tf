output "vpc_id" {
  value = module.vpc.vpc_id
}
output "pub_subnet" {
  value = module.vpc.pub_subnet[*]
}
output "pri_subnet" {
  value = module.vpc.pri_subnet[*]
}
output "igw_id" {
  value = module.vpc.igw_id
}
output "alb_sg_id" {
  value = module.sg.alb_sg_id
}
output "webserver_sg_id" {
  value = module.sg.webserver_sg_id
}
output "instance_id" {
  value = module.ec2.instance_id
}
output "load_balancer_arn" {
  value = module.alb.load_balancer_arn
}
output "rds_endpoint" {
  value = module.rds.rds_endpoint
}
output "load_balancer_dns" {
  value = module.alb.load_balancer_dns
  
}


