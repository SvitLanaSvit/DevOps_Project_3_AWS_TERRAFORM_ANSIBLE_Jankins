# ========================================
# EC2 INSTANCES
# ========================================
# Цей файл містить ресурси для EC2 instances та Key Pair

# Key Pair для EC2 instances
resource "aws_key_pair" "ec2" {
  key_name   = "${var.resource_name}-key"
  public_key = var.public_key_content
  tags = {
    Name = "${var.resource_name}-key-pair"
  }
}

# EC2 Instance у публічній підмережі (Jump Host / Bastion)
resource "aws_instance" "public" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.ec2.key_name
  vpc_security_group_ids = [var.public_security_group_id]
  subnet_id              = var.public_subnet_id
  tags = {
    Name        = "${var.resource_name}-public-ec2"
    Type        = "Public"
    Environment = var.environment
    Role        = "Jump-Host"
  }
}

# EC2 Instance у приватній підмережі
resource "aws_instance" "private" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.ec2.key_name
  vpc_security_group_ids = [var.private_security_group_id]
  subnet_id              = var.private_subnet_id

  instance_market_options {
    market_type = "spot"
    spot_options {
      #max_price = "0.05" # або залишити порожнім для поточної ціни
      spot_instance_type = "one-time"
    }
  }

  tags = {
    Name        = "${var.resource_name}-private-ec2"
    Type        = "Private"
    Environment = var.environment
    Role        = "Backend-Server"
  }
}