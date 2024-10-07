aws_region    = "us-west-1"
resource_name = "demo-aqeel"
vpc_cidr      = "10.0.0.0/16"
ec2_ami       = "ami-0d5"
instance_type = "t2.micro"
key_name      = "mykeyaqeel-tf"
instance_class = "db.t3.micro"
db_name        = ""
db_password    = ""
db_username    = ""
pub_subnet = [
  {
    name              = "demo-aqeel-Public-Subnet-1"
    cidr_block        = "10.0.1.0/24"
    availability_zone = "us-west-1a"
  },
  {
    name              = "demo-aqeel-Public-Subnet-2"
    cidr_block        = "10.0.2.0/24"
    availability_zone = "us-west-1c"
  }
]

pri_subnet = [
  {
    name              = "demo-aqeel-Private-Subnet-1"
    cidr_block        = "10.0.3.0/24"
    availability_zone = "us-west-1a"
  },
  {
    name              = "demo-aqeel-Private-Subnet-2"
    cidr_block        = "10.0.4.0/24"
    availability_zone = "us-west-1c"
  }
]
