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
# variable "iam_rds_tags" {
#   type = map(string)
#   description = ""
# }
