variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}
variable "instance_type" {
  description = "Type of EC2 instance (e.g. t2.micro)"
  type        = string
}

variable "resource_name" {
  description = "Project name for tagging resources"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. dev, prod)"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet for EC2"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet for EC2"
  type        = string
}

variable "public_security_group_id" {
  description = "ID of the public security group for EC2"
  type        = string
}

variable "private_security_group_id" {
  description = "ID of the private security group for EC2"
  type        = string
}

variable "public_key_content" {
  description = "Public key content for EC2 key pair"
  type        = string
}

variable "common_tags" {
  type = map(string)
  description = "Common tags for resources"
  default = {}
}
