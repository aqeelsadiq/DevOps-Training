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