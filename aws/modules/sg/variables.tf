variable "vpc_id" {
  type        = string
  description = "VPC ID where the security group will be created"
}

variable "my_ip" {
  type        = string
  description = "Your public IP address in CIDR notation (e.g., 'x.x.x.x/32')"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
}

variable "sg_tags" {
  type        = map(string)
  description = "Tags to apply to the security group"
}