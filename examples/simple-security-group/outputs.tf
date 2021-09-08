
output "security_group_id" {
  description = "The ID of the Security Group"
  value       = module.ssh_sg.security_group_id
}

output "security_group_name" {
  description = "The name of the Security Group"
  value       = module.ssh_sg.security_group_name
}

output "security_group_description" {
  description = "The description of the Security Group"
  value       = module.ssh_sg.security_group_description
}
