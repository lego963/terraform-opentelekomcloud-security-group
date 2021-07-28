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

  name        = "${var.prefix}_sg"
  description = var.description
}


##########################
# Ingress - Maps of rules
##########################

resource "opentelekomcloud_networking_secgroup_rule_v2" "this" {
  count = var.create ? length(var.ingress_rules) : 0

  direction = "ingress"
  ethertype = "IPv4"

  description = lookup(
    var.ingress_rules[count.index],
    "description",
    "Ingress Rule",
  )

  port_range_min = lookup(
    var.ingress_rules[count.index],
    "from_port",
    0
  )
  port_range_max = lookup(
    var.ingress_rules[count.index],
    "to_port",
    0
  )
  protocol = lookup(
    var.ingress_rules[count.index],
    "protocol",
    "icmp"
  )

  remote_ip_prefix = lookup(
    var.ingress_rules[count.index],
    "remote_cidr",
    "0.0.0.0/0"
  )

  security_group_id = locals.secgroup_id
}

#########################
# Egress - Maps of rules
#########################
resource "opentelekomcloud_networking_secgroup_rule_v2" "this" {
  count = var.create ? length(var.egress_rules) : 0

  direction = "egress"
  ethertype = "IPv4"

  description = lookup(
    var.egress_rules[count.index],
    "description",
    "Egress Rule",
  )

  port_range_min = lookup(
    var.egress_rules[count.index],
    "from_port",
    0
  )
  port_range_max = lookup(
    var.egress_rules[count.index],
    "to_port",
    0
  )
  protocol = lookup(
    var.egress_rules[count.index],
    "protocol",
    "icmp"
  )
  remote_ip_prefix = lookup(
    var.egress_rules[count.index],
    "remote_cidr",
    "0.0.0.0/0"
  )

  security_group_id = local.secgroup_id
}
