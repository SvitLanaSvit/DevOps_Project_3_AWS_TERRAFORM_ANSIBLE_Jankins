# Security Group для публічного EC2 (Jump Host/Jenkins)
resource "aws_security_group" "public_ec2" {
  name        = "${var.resource_name}-public-sg"
  description = "Security Group for public EC2 (Jump Host/Jenkins)"
  vpc_id      = var.vpc_id

  # Правила вхідного трафіку для публічного EC2 (Jump Host/Jenkins)
  ingress {
    description = "SSH from your IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_allowed_cidr]
  }

  # Правила вхідного трафіку для Jenkins Web UI
  ingress {
    description = "Jenkins Web UI"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.jenkins_allowed_cidr]
  }

  # Правила вихідного трафіку для публічного EC2 (Jump Host/Jenkins)
  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, {
    Name = "${var.resource_name}-public-sg"
    Type = "Public"
  })
}

# Security Group для приватного EC2
resource "aws_security_group" "private_ec2" {
  name        = "${var.resource_name}-private-sg"
  description = "Security Group for private EC2 instance"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from Public Subnet (Jump Host)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_cidr]
  }

  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, {
    Name = "${var.resource_name}-private-sg"
    Type = "Private"
  })
}