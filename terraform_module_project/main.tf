#####################################
#  MODULES
#####################################

module "vpc" {
  source        = "./modules/vpc"
  aws_region    = var.aws_region
  vpc_cidr      = var.vpc_cidr
  resource_name = var.resource_name
  pub_subnet    = var.pub_subnet
  pri_subnet    = var.pri_subnet
}

####################################
# Security Group
####################################
module "sg" {
  source        = "./modules/sg"
  vpc_id        = module.vpc.vpc_id
  resource_name = var.resource_name
}


#####################################
#  EC2
#####################################
module "ec2" {
  source            = "./modules/ec2"
  vpc_id            = module.vpc.vpc_id
  security_group_id = module.sg.webserver_sg_id
  resource_name     = var.resource_name
  ec2_ami           = var.ec2_ami
  instance_type     = var.instance_type
  key_name          = var.key_name
  pub_subnet        = module.vpc.pub_subnet
  target_group_arn  = module.alb.target_group_arn
  rds_endpoint = module.rds.rds_endpoint
}



######################################
#  ALB
######################################
module "alb" {
  source            = "./modules/alb"
  vpc_id            = module.vpc.vpc_id
  security_group_id = module.sg.alb_sg_id
  resource_name     = var.resource_name
  pub_subnet        = module.vpc.pub_subnet

}


#####################################
# Autoscaling
#####################################
module "asg" {
  source            = "./modules/asg"
  security_group_id = module.sg.webserver_sg_id
  resource_name     = var.resource_name
  ec2_ami           = var.ec2_ami
  instance_type     = var.instance_type
  pub_subnet        = module.vpc.pub_subnet
  key_name          = var.key_name
  target_group_arn  = module.alb.target_group_arn
  aws_launch_template = module.ec2.aws_launch_template
  instance_profile_name = module.ec2.instance_profile_name
}


#####################################
# RDS Instance
#####################################

module "rds" {
  source            = "./modules/rds"
  db_name           = var.db_name
  db_password       = var.db_password
  db_username       = var.db_username
  resource_name     = var.resource_name
  security_group_id = module.sg.rds_sg_id
  pri_subnet        = module.vpc.pri_subnet
  instance_class    = var.instance_class

}












