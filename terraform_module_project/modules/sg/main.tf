resource "aws_security_group" "alb_sg" {
    vpc_id = var.vpc_id


    dynamic "ingress" {
      for_each = [80, 443]
        iterator = port
      content {
        from_port   = port.value
        to_port     = port.value
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  tags = {
    Name = "${var.resource_name}-alb-sg"
  }
}

resource "aws_security_group" "webserver_sg" {
    vpc_id = var.vpc_id


    dynamic "ingress" {
      for_each = [22, 80, 443]
        iterator = port
      content {
        from_port   = port.value
        to_port     = port.value
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
    egress {
        from_port   = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  tags = {
    Name = "${var.resource_name}-webserver-sg"
  }
}


resource "aws_security_group" "db_sg" {
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = [3306]
      iterator = port
    content {
      from_port = port.value
      to_port   = port.value
      protocol = "tcp"
      security_groups = [aws_security_group.webserver_sg.id]
    }
  }
  egress {
      from_port   = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  tags = {
    Name = "${var.resource_name}-db-sg"
  }
}