module "vpc" {
  source = "../../../modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  resource_name = local.resource_name
  common_tags = local.common_tags
}

module "public_subnet" {
  source = "../../../modules/public_subnet"
  vpc_id = module.vpc.vpc_id
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone = var.availability_zone
  subnet_name = var.public_subnet_name
  common_tags = local.common_tags
}

module "private_subnet" {
  source = "../../../modules/private_subnet"
  vpc_id = module.vpc.vpc_id
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone = var.availability_zone
  subnet_name = var.private_subnet_name
  common_tags = local.common_tags
}

module "internet_gateway" {
  source = "../../../modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
  igw_name = var.igw_name
  public_route_table_name = var.public_route_table_name
  public_subnet_id = module.public_subnet.public_subnet_id
  common_tags = local.common_tags
}

module "nat_gateway" {
  source = "../../../modules/nat_gateway"
  vpc_id = module.vpc.vpc_id
  public_subnet_id = module.public_subnet.public_subnet_id
  private_subnet_id = module.private_subnet.private_subnet_id
  eip_name = var.eip_name
  nat_name = var.nat_name
  private_route_table_name = var.private_route_table_name
  common_tags = local.common_tags
}

module "network" {
  source = "../../../modules/network"
  resource_name = var.resource_name
  vpc_id = module.vpc.vpc_id
  ssh_allowed_cidr = local.ssh_allowed_cidr
  jenkins_allowed_cidr = var.jenkins_allowed_cidr
  public_subnet_cidr = var.public_subnet_cidr
  common_tags = local.common_tags
}

module "ec2" {
  source = "../../../modules/ec2"
  instance_type = var.instance_type
  resource_name = var.resource_name
  ami_id = data.aws_ami.ubuntu.id
  environment = var.environment
  public_subnet_id = module.public_subnet.public_subnet_id
  private_subnet_id = module.private_subnet.private_subnet_id
  public_security_group_id = module.network.security_group_id
  private_security_group_id = module.network.private_security_group_id
  public_key_content = var.public_key_content
  common_tags = local.common_tags
}

resource "aws_key_pair" "ansible" {
  key_name   = "ansible-key"
  public_key = var.public_key_content
}

resource "local_file" "ansible_inventory" {
  content  = data.template_file.ansible_inventory.rendered
  filename = "${path.module}/ansible_hosts"
}