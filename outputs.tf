output "security_group_id" {
  description = "The ID of the Security Group"
  value       = concat(opentelekomcloud_networking_secgroup_v2.this.*.id, [""])[0]
}
