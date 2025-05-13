variable "ami" {
  type        = string
  description = "The AMI ID to use for the instance."
}

variable "instance_type" {
  type        = string
  description = "The instance type to use."
}

variable "subnet_id" {
  type        = string
  description = "The subnet ID to launch the EC2 instance in."
}

variable "security_group_id" {
  type        = string
  description = "The security group ID to associate with the instance."
}

variable "key_name" {
  description = "The name of the SSH key pair to be used for access."
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP with the instance."
  type        = bool
}
variable "iam_instance_profile" {
  description = "The IAM instance profile to assign to the EC2 instance"
  type        = string
}

variable "ec2_tags" {
  description = "Tags to apply to the EC2 instance."
  type        = map(string)
}

# variable "volume_size" {
#   description = "The size of the root volume."
#   type        = number
# }

# variable "volume_type" {
#   description = "The type of the root volume."
#   type        = string
# }
