output "security_group_id" {
  value = aws_security_group.public_ec2.id
  description = "ID of the created security group"
}

output "private_security_group_id" {
  value       = aws_security_group.private_ec2.id
  description = "ID of the private EC2 security group"
}