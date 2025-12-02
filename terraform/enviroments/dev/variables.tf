variable "aws_region" {
  type    = string
}

variable "environment" {
  type = string
}

variable "instance_type" {
  type    = string
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  type        = string
  description = "Name tag for the VPC"
}

variable "resource_name" {
  type        = string
  description = "Project name for tagging resources"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet"
}

variable "private_subnet_cidr" {
  type = string
  description = "CIDR block for the private subnet"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone for the subnet"
}

variable "public_subnet_name" {
  type        = string
  description = "Name tag for the public subnet"
}

variable "private_subnet_name" {
  type        = string
  description = "Name tag for the private subnet"
}

variable "public_key_content" {
  description = "Вміст публічного SSH ключа для доступу до EC2"
  type        = string
  sensitive   = true
}

variable "igw_name" {
  type        = string
  description = "Name tag for the Internet Gateway"
}

variable "public_route_table_name" {
  type        = string
  description = "Name tag for the public route table"
}

variable "eip_name" {
  type        = string
  description = "Name tag for the Elastic IP"
}

variable "nat_name" {
  type        = string
  description = "Name tag for the NAT Gateway"
}

variable "private_route_table_name" {
  type        = string
  description = "Name tag for the private route table"
}

variable "ssh_allowed_cidr" {
  type        = string
  description = "CIDR block allowed for SSH access"
}

variable "jenkins_allowed_cidr" {
  type        = string
  description = "CIDR block allowed for Jenkins Web UI access"
}

variable "master_private_ip_cidr" {
  type        = string
  description = "CIDR block of Jenkins master private IP for SSH access to worker."
}