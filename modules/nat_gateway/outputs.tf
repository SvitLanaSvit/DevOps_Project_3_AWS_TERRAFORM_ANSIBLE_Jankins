output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.nat.id
}

output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = aws_route_table.private.id
}

output "nat_eip_id" {
  description = "The ID of the Elastic IP for NAT Gateway"
  value       = aws_eip.nat_eip.id
}
