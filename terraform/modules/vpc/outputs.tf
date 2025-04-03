output "private_subnet_id" {
  value = [aws_subnet.private.id]
}

output "privateB_subnet_id" {
  value = [aws_subnet.private_b.id]
}


output "private_subnets_cidrs" {
  description = "CIDR blocks de las subnets privadas"
  value       = aws_subnet.private[*].cidr_block
}

output "public_subnets_cidrs" {
  description = "CIDR blocks de las subnets públicas"
  value       = aws_subnet.public[*].cidr_block
}


output "private_subnet_ids" {
  value = [aws_subnet.private.id, aws_subnet.private_b.id]
  description = "List of private subnet IDs"
}

output "vpc_id" {
  value       = aws_vpc.dev_vpc.id
  description = "The ID of the VPC"
}

