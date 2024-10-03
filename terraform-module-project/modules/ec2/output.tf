output "key_name" {
    value = aws_key_pair.mykey-tf.key_name
  
}
output "instance_id" {
    value = aws_instance.webserver[*].id
}

output "aws_launch_template" {
  value = aws_launch_template.template.id
}