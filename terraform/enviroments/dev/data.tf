# Отримання публічної IP-адреси користувача
data "http" "my_ip" {
  url = "https://checkip.amazonaws.com"
}

# Отримання доступних зон доступності
data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

data "template_file" "ansible_inventory" {
  template = file("${path.module}/ansible_hosts.tpl")
  vars = {
    public_ip  = module.ec2.public_instance_public_ip
    private_ip = module.ec2.private_instance_private_ip
  }
}