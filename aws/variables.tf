variable "aws_region" {
  type        = string
  description = "The AWS region to create resources in."
}



variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC."
}
variable "public_subnet_cidr" {
  type        = string
  description = "The CIDR block for the public subnet."
}
variable "private_subnet_1_cidr" {
  type        = string
  description = "The CIDR block for the first private subnet."
}
variable "private_subnet_2_cidr" {
  type        = string
  description = "The CIDR block for the second private subnet."
}
variable "public_subnet_az" {
  type        = string
  description = "The availability zone for the public subnet."
}
variable "private_subnet_1_az" {
  type        = string
  description = "The availability zone for the first private subnet."
}
variable "private_subnet_2_az" {
  type        = string
  description = "The availability zone for the second private subnet."
}
variable "vpc_tags" {
  type        = map(string)
  description = "Tags to assign to resources."
}



variable "iam_tags" {
  type        = map(string)
  description = "Tags to assign to resources."
}
variable "s3_policy" {
  type        = list
  description = "policy to assign to resources."
}
variable "ssm_policy" {
  type        = list
  description = "policy to assign to resources."
}
variable "iam_instance_profile" {
  description = "The IAM instance profile to assign to the EC2 instance"
  type        = string
}



variable "my_ip" {
  type        = string
  description = "Your public IP address in CIDR notation (e.g., 'x.x.x.x/32')"
}
variable "sg_tags" {
  type        = map(string)
  description = "Tags to apply to the security group"
}



variable "instance_type" {
  type        = string
  description = "instance-type to assign to resources."
}
variable "ec2_ami" {
  type        = string
  description = "ami to assign to resources."
}
variable "associate_public_ip_address" {
  description = "Whether to associate a public IP with the instance"
  type        = bool
}
variable "key_name" {
  description = "The name of the SSH key pair to be used for access."
  type        = string
}
# variable "volume_size" {
#   description = "The size of the root volume."
#   type        = number
# }
# variable "volume_type" {
#   description = "The type of the root volume."
#   type        = string
# }
variable "ec2_tags" {
  description = "Tags to apply to the EC2 instance"
  type        = map(string)
}


variable "identifier" {
  type = string  
}
variable "engine" {
  type = string  
}
variable "engine_version" {
  type = string
}
variable "instance_class" {
  type = string
}
variable "allocated_storage" {
  type = number
}
variable "db_name" {
  type = string
}
variable "username" {
  type = string
}
variable "port" {
  type = string
}
variable "iam_database_authentication_enabled" {
  type = bool
}
variable "rds_tags" {
  type = map(string)
}
variable "password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}