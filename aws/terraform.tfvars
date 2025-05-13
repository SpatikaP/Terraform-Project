aws_region          = "ap-south-1"
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_1_cidr = "10.0.2.0/24"
private_subnet_2_cidr = "10.0.3.0/24"
public_subnet_az    = "ap-south-1a"
private_subnet_1_az = "ap-south-1b"
private_subnet_2_az = "ap-south-1c"
vpc_tags = {
  Name        = "VPC"
  Environment = "Development"
}


s3_policy = ["s3:ListAllMyBuckets", "s3:ListBucket"]
ssm_policy = [ "ssm:DescribeInstanceInformation", "ssm:GetConnectionStatus", "ssm:SendCommand", "ssm:ListAssociations", "ssm:ListCommands", "ssm:UpdateInstanceInformation", "ssm:ListCommandInvocations", "ssm:CreateAssociation", "ssm:UpdateAssociation"]
iam_tags = { Name = "ec2_role" }
iam_instance_profile = "hello"

my_ip = "10.221.48.48/32"
sg_tags = { Name = "sg_tags"}




instance_type = "t3.micro"
ec2_ami  = "ami-0522ab6e1ddcc7055"
ec2_tags = { Name = "my-ec2"}
key_name = null
associate_public_ip_address = false

identifier = "my-rds"
engine = "mysql"
engine_version = "5.7"
instance_class = "db.t3.medium"
allocated_storage = 5
db_name  = "demodb"
username = "spatika"
port     = "3306"
iam_database_authentication_enabled = true
rds_tags = { Name = "my-rds"}
password = "lumiq123"