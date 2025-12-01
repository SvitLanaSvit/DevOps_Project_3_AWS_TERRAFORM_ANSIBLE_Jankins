# ========================================
# VPC RESOURCES
# ========================================
# Цей файл містить ресурси для VPC та підмереж

# Основний VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(var.common_tags, {
    Name = "${var.resource_name}-vpc"
  })
}
