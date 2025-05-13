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
