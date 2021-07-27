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

  description = lookup(
    var.ingress_rules[count.index],
    "description",
    "Ingress Rule",
  )
  direction = "ingress"
  ethertype = "IPv4"

  port_range_min = lookup(
    var.ingress_rules[count.index],
    "from_port",
    var.ingress_rules[lookup(
      var.ingress_rules[count.index],
      "rule",
      "_",
    )][0],
  )
  port_range_max = lookup(
    var.ingress_rules[count.index],
    "to_port",
    var.rules[lookup(
      var.ingress_rules[count.index],
      "rule",
      "_",
    )][1],
  )

  protocol = lookup(
    var.ingress_rules[count.index],
    "protocol",
    var.rules[lookup(
      var.ingress_rules[count.index],
      "rule",
      "_",
    )][2],
  )

  security_group_id = locals.secgroup_id
}

#########################
# Egress - Maps of rules
#########################
resource "opentelekomcloud_networking_secgroup_rule_v2" "this" {
  count = var.create ? length(var.egress_rules) : 0

  type      = "egress"
  ethertype = "IPv4"

  description = lookup(
    var.egress_rules[count.index],
    "description",
    "Egress Rule",
  )

  from_port = lookup(
    var.egress_rules[count.index],
    "from_port",
    var.rules[lookup(
      var.egress_rules[count.index],
      "rule",
      "_",
    )][0],
  )
  to_port = lookup(
    var.egress_rules[count.index],
    "to_port",
    var.rules[lookup(
      var.egress_rules[count.index],
      "rule",
      "_",
    )][1],
  )
  protocol = lookup(
    var.egress_rules[count.index],
    "protocol",
    var.rules[lookup(
      var.egress_rules[count.index],
      "rule",
      "_",
    )][2],
  )

  security_group_id = local.this_sg_id
}
