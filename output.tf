output "resource_group_name" {
  description = "Deployed Resource Group name"
  value       = module.network.rg_name
}

output "vnet_name" {
  description = "Virtual Network name"
  value       = module.network.vnet_name
}

output "vm_name" {
  description = "Windows VM name"
  value       = module.compute.vm_name
}

output "vm_public_ip" {
  description = "Public IP address for RDP"
  value       = module.compute.vm_public_ip
}

output "vm_private_ip" {
  description = "Private IP of the VM NIC"
  value       = module.compute.vm_private_ip
}

output "rdp_command" {
  description = "Run this command to open RDP session"
  value       = module.compute.rdp_command
}
