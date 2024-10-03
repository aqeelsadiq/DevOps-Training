output "vpc_id" {
    value       = aws_vpc.main-vpc.id
}

output "pub_subnet" {
    value       = aws_subnet.pub-subnet1.*.id
}


output "pri_subnet" {
    value       = aws_subnet.pri-subnet1.*.id
}

output "igw_id" {
    value = aws_internet_gateway.igw.id
}

