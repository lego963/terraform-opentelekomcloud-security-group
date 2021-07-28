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
  description = "(optional )Whether to create Security Group"

  default = true
}

variable "prefix" {
  type        = string
  description = "(optional) prefix for Security Group"

  default = "default"
}

variable "security_group_id" {
  type        = string
  description = "(optional) The ID of the Security Group"

  default = ""
}

############################
# Security Group Rules Vars
############################

variable "ingress_rules" {
  type        = list(object({ from_port = number, to_port = number, description = string, protocol = string, remote_cidr = string }))
  description = "(optional) The Ingress Rules for Security Group"

  default = [
    {
      from_port = 22
      protocol  = "tcp"
      to_port   = 22
    },
    {
      from_port = 0
      protocol  = "icmp"
      to_port   = 0
    }
  ]
}

variable "egress_rules" {
  type        = list(object({ from_port = number, to_port = number, description = string, protocol = string, remote_cidr = string }))
  description = "(optional) The Egress Rules for Security Group"

  default = []
}
