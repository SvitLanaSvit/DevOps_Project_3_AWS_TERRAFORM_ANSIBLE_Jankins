variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "igw_name" {
  description = "Name tag for the Internet Gateway"
  type        = string
}

variable "public_route_table_name" {
  description = "Name tag for the public route table"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet for route table association"
  type        = string
}

variable "common_tags" {
  type = map(string)
  description = "Common tags for resources"
  default = {}
}
