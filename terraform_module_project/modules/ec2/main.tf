resource "aws_key_pair" "mykey-tf" {
  key_name   = "mykeyaqeel-tf"
  public_key = file("${path.module}/id_rsa.pub")

}


resource "aws_instance" "webserver" {
    count = 2
    ami = var.ec2_ami
    instance_type = var.instance_type
    vpc_security_group_ids = [var.security_group_id]
    subnet_id = var.pub_subnet[count.index]
    key_name = aws_key_pair.mykey-tf.key_name
    associate_public_ip_address = true
    iam_instance_profile = aws_iam_instance_profile.ssm_instance_profile.name

    tags = {
      Name = "${var.resource_name}-webserver"
    }
    user_data = file("${path.module}/user_data.sh")
}

#target group attachement

resource "aws_lb_target_group_attachment" "Instance-attachment" {
    count = length(aws_instance.webserver)
    target_group_arn = var.target_group_arn
    target_id        = aws_instance.webserver[count.index].id
    port             = "80"
}


#launch template
resource "aws_launch_template" "template" {
  name_prefix   = "${var.resource_name}-asg"
  image_id      = var.ec2_ami
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = filebase64("${path.module}/user_data.sh")

  iam_instance_profile {
    name = aws_iam_instance_profile.ssm_instance_profile.name
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.security_group_id]
  }
  
  tag_specifications {
    resource_type = "instance"

    tags = { 
      Name = "${var.resource_name}-launch-template-webserver"
    }
  }

}

#ima role
resource "aws_iam_role" "ssm_role" {
  name = "EC2SSMRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}


resource "aws_iam_role_policy_attachment" "ssm_policy_attach" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess"
}
resource "aws_iam_role_policy_attachment" "rds_access" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSReadOnlyAccess"
}
resource "aws_iam_instance_profile" "ssm_instance_profile" {
  name = "EC2SSMInstanceProfile"
  role = aws_iam_role.ssm_role.name
}
