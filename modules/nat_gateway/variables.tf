variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet for NAT Gateway"
  type        = string
}

variable "private_subnet_id" {
  description = "The ID of the private subnet for NAT Gateway"
  type        = string
}

variable "eip_name" {
  description = "Name tag for the Elastic IP"
  type        = string
}

variable "nat_name" {
  description = "Name tag for the NAT Gateway"
  type        = string
}

variable "private_route_table_name" {
  description = "Name tag for the private route table"
  type        = string
}

variable "common_tags" {
  type = map(string)
  description = "Common tags for resources"
  default = {}
}
