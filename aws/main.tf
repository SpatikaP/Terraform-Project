provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
  public_subnet_az = var.public_subnet_az
  private_subnet_1_az = var.private_subnet_1_az
  private_subnet_2_az = var.private_subnet_2_az
  vpc_tags = var.vpc_tags
}

module "iam" {
    source = "./modules/iam"
    s3_policy = var.s3_policy
    ssm_policy = var.ssm_policy
    iam_tags = var.iam_tags
}

module "sg" {
  source = "./modules/sg"
  vpc_id      = module.vpc.vpc_id
  vpc_cidr    = module.vpc.vpc_cidr
  my_ip  = var.my_ip
  sg_tags = var.sg_tags

  depends_on = [module.vpc]
}

module "ec2" {
  source                     = "./modules/ec2"
  ami                        = var.ec2_ami
  instance_type              = var.instance_type
  subnet_id                  = module.vpc.private_subnet_1_id  
  security_group_id          = module.sg.sg_id                 
  key_name                   = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile       = module.iam.ec2_instance_profile_name
  ec2_tags                   = var.ec2_tags                 

  depends_on = [module.iam, module.sg, module.vpc]
}


module "rds" {
  source = "./modules/rds"
  identifier = var.identifier
  engine = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  allocated_storage = var.allocated_storage
  db_name = var.db_name
  username = var.username
  password = var.password
  port = var.port
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  security_group_id = module.sg.sg_id
  subnet_ids = module.vpc.private_subnet_ids  
  db_subnet_group_name  = "my-rds-subnet-group"
  rds_tags = var.rds_tags
  # iam_roles = var.rds_iam_roles
  depends_on = [module.sg]
}