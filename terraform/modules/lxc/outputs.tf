output "vm_id" {
  value       = proxmox_virtual_environment_container.this.vm_id
  description = "Container VM ID"
}

output "hostname" {
  value       = proxmox_virtual_environment_container.this.initialization[0].hostname
  description = "Container hostname"
}

output "ip_address" {
  value       = var.ip_address
  description = "Container IP address"
}
