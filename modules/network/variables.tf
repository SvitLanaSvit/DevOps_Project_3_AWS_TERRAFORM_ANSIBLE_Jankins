variable "resource_name" {
  type = string
  description = "Name for resources (optional, for tags)"
  default = "network"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "CIDR block allowed for SSH access"
  type        = string
}

variable "jenkins_allowed_cidr" {
  description = "CIDR block allowed for Jenkins Web UI access"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block of the public subnet for private EC2 access"
  type        = string
}

variable "common_tags" {
  type = map(string)
  description = "Common tags for resources"
  default = {}
}