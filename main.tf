###################################
# Get ID of created Security Group
###################################
locals {
  secgroup_id = var.create_sg ? concat(opentelekomcloud_networking_secgroup_v2.this.*.id, [""])[0] : var.security_group_id
}

############################
# Networking Security Group
############################

resource "opentelekomcloud_networking_secgroup_v2" "this" {
  count = var.create && var.create_sg ? 1 : 0

  name                 = "${var.prefix}_sg"
  description          = var.description
  delete_default_rules = var.delete_default_rules
}

####################
# Self Ingress rule
####################
resource "opentelekomcloud_networking_secgroup_rule_v2" "self_ingress_rule" {
  count = var.create && var.create_self_ingress_rule ? 1 : 0

  direction         = "ingress"
  ethertype         = "IPv4"
  remote_group_id   = local.secgroup_id
  security_group_id = local.secgroup_id
}

################
# Ingress rules
################

resource "opentelekomcloud_networking_secgroup_rule_v2" "ingress_with_source_security_group_id" {
  count = var.create ? length(var.ingress_with_source_security_group_id) : 0

  security_group_id = local.secgroup_id
  direction         = "ingress"
  ethertype         = "IPv4"

  protocol        = var.ingress_with_source_security_group_id[count.index]["protocol"]
  port_range_min  = var.ingress_with_source_security_group_id[count.index]["from_port"]
  port_range_max  = var.ingress_with_source_security_group_id[count.index]["to_port"]
  remote_group_id = var.ingress_with_source_security_group_id[count.index]["source_security_group_id"]
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "ingress_with_source_cidr" {
  count = var.create ? length(var.ingress_with_source_cidr) : 0

  security_group_id = local.secgroup_id
  direction         = "ingress"
  ethertype         = "IPv4"

  protocol         = var.ingress_with_source_cidr[count.index]["protocol"]
  port_range_min   = var.ingress_with_source_cidr[count.index]["from_port"]
  port_range_max   = var.ingress_with_source_cidr[count.index]["to_port"]
  remote_ip_prefix = var.ingress_with_source_cidr[count.index]["source_cidr"]
}

###############
# Egress rules
###############

resource "opentelekomcloud_networking_secgroup_rule_v2" "egress_with_source_security_group_id" {
  count = var.create ? length(var.egress_with_source_security_group_id) : 0

  security_group_id = local.secgroup_id
  direction         = "egress"
  ethertype         = "IPv4"

  protocol        = var.egress_with_source_security_group_id[count.index]["protocol"]
  port_range_min  = var.egress_with_source_security_group_id[count.index]["from_port"]
  port_range_max  = var.egress_with_source_security_group_id[count.index]["to_port"]
  remote_group_id = var.egress_with_source_security_group_id[count.index]["destination_security_group_id"]
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "egress_with_source_cidr" {
  count = var.create ? length(var.egress_with_source_cidr) : 0

  security_group_id = local.secgroup_id
  direction         = "egress"
  ethertype         = "IPv4"

  protocol         = var.egress_with_source_cidr[count.index]["protocol"]
  port_range_min   = var.egress_with_source_cidr[count.index]["from_port"]
  port_range_max   = var.egress_with_source_cidr[count.index]["to_port"]
  remote_ip_prefix = var.egress_with_source_cidr[count.index]["destination_cidr"]
}
