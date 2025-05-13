# variable "subnet_id" {
#   type        = string
#   description = "The subnet ID to launch the EC2 instance in."
# }
variable "security_group_id" {
  type        = string
  description = "The security group ID to associate with the instance."
}
variable "rds_tags" {
  type = map(string)
}
variable "identifier" {
  type =string  
}
variable "engine" {
  type =string  
}
variable "engine_version" {
  type = string
}
variable "instance_class"{
  type = string
}
variable "allocated_storage" {
  type = number
}
variable "db_name"{
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
variable "password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}
variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
}
variable "subnet_ids" {
  description = "List of subnet IDs for the RDS instance"
  type        = list(string)
}
# variable "rds_iam_roles" {
#   description = "List of IAM roles to attach to the RDS instance for authentication"
#   type        = list(string)
#   default     = []  # Empty by default if no IAM role is provided
# }