output "private_subnet_id" {
	value       = aws_subnet.private.id
	description = "ID of the private subnet"
}
