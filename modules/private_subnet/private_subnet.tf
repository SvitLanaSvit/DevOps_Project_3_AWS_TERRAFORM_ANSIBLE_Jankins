# Приватна підмережа
resource "aws_subnet" "private" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone

  tags = merge(var.common_tags, {
    Name = "${var.subnet_name}-private-subnet"
    Type = "Private"
  })
}