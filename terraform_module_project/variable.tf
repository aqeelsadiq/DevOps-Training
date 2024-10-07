variable "aws_region" {}
variable "resource_name" {}
variable "vpc_cidr" {}
variable "pub_subnet" {
  type = list(map(string))
}
variable "pri_subnet" {
  type = list(map(string))
}
variable "ec2_ami" {}
variable "instance_type" {}
variable "key_name" {}

variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "instance_class" {}