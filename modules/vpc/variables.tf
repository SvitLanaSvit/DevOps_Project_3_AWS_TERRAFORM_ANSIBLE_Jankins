variable "vpc_cidr" {
  description = "CIDR блок для VPC"
  type        = string
}

variable "resource_name" {
  description = "Назва проекту для тегування ресурсів"
  type        = string
}
variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
}

variable "common_tags" {
  type = map(string)
  description = "Common tags for resources"
  default = {}
}