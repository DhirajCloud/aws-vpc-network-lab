output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = aws_subnet.private.id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "public_route_table_id" {
  description = "ID of the public route table"
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "ID of the private route table"
  value       = aws_route_table.private.id
}

output "security_group_id" {
  description = "ID of the public EC2 security group"
  value       = aws_security_group.public.id
}

output "ec2_instance_id" {
  description = "ID of the public EC2 instance"
  value       = aws_instance.public.id
}

output "ec2_private_ip" {
  description = "Private IP address of the public EC2 instance"
  value       = aws_instance.public.private_ip
}

output "ec2_public_ip" {
  description = "Public IP address of the public EC2 instance"
  value       = aws_instance.public.public_ip
}
