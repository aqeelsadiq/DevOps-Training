resource "aws_db_instance" "rds_instance" {
    allocated_storage    = 10
    identifier = "${var.resource_name}-database"
    db_name              = var.db_name
    engine               = "mysql"
    engine_version       = "8.0"
    instance_class       = var.instance_class
    username             = var.db_username
    password             = var.db_password
    parameter_group_name = "default.mysql8.0"
    skip_final_snapshot  = true
    vpc_security_group_ids = [var.security_group_id]
    db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

    tags = {
      Name = "${var.resource_name}-db-instance"
  
    }
}

resource "aws_db_subnet_group" "db_subnet_group" {
    name = "my-db-subnet-group"
    subnet_ids = var.pri_subnet
  
    tags = {
      Name = "${var.resource_name}-db-subnet-group"
    }
}



resource "aws_ssm_parameter" "rds_endpoint_param" {
  name  = "/wordpress/rds_endpoint"
  type  = "String"
  value = aws_db_instance.rds_instance.endpoint
}