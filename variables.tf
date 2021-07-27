##############
# Common Vars
##############

variable "security_group_id" {
  type        = string
  description = "(optional) The ID of the Security Group"

  default = ""
}
