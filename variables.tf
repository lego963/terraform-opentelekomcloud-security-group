##############
# Common Vars
##############

variable "create" {
  type        = bool
  description = "(optional) Whether to create Security Group and all rules"

  default = true
}

variable "create_sg" {
  type        = bool
  description = "(optional) Whether to create Security Group"

  default = true
}

variable "security_group_id" {
  type        = string
  description = "(optional) The ID of the Security Group"

  default = ""
}

############################
# Security Group Vars
############################

variable "prefix" {
  type        = string
  description = "(optional) Prefix for Security Group"

  default = "default"
}

variable "description" {
  type        = string
  description = "(optional) The Security Group description"

  default = ""
}

variable "delete_default_rules" {
  type        = bool
  description = "(optional) Wheter to delete default rules"

  default = false
}

############################
# Security Group Rules Vars
############################

variable "ingress_with_source_security_group_id" {
  type        = list(object({ from_port = number, to_port = number, protocol = string, source_security_group_id = string }))
  description = "(optional) List of ingress rules to create where a security group is remote"

  default = []
}

variable "ingress_with_source_cidr" {
  type        = list(object({ from_port = number, to_port = number, protocol = string, source_cidr = string }))
  description = "(optional) List of ingress rules to create where a CIDR is remote"

  default = []
}

variable "egress_with_source_security_group_id" {
  type        = list(object({ from_port = number, to_port = number, protocol = string, destination_security_group_id = string }))
  description = "(optional) List of egress rules to create where a security group is remote"

  default = []
}

variable "egress_with_source_cidr" {
  type        = list(object({ from_port = number, to_port = number, protocol = string, destination_cidr = string }))
  description = "(optional) List of egress rules to create where a CIDR is remote"

  default = []
}
