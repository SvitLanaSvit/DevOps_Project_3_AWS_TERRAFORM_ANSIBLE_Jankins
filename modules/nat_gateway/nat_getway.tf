# ========================================
# NAT GATEWAY & PRIVATE ROUTING
# ========================================
# Цей файл містить ресурси для NAT Gateway та приватної маршрутизації

# Elastic IP для NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = "${var.eip_name}-nat-eip"
  }
}

# NAT Gateway у публічній підмережі
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.public_subnet_id
  tags = {
    Name = "${var.nat_name}-nat-gw"
  }
}

# Route Table для приватної підмережі
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "${var.private_route_table_name}-private-rt"
  }
}

# Асоціація Route Table з приватною підмережею
resource "aws_route_table_association" "private" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.private.id
}