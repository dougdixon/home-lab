variable "proxmox_endpoint" {
  type        = string
  description = "Proxmox API endpoint URL (e.g. https://192.168.10.1:8006)"
}

variable "proxmox_username" {
  type        = string
  description = "Proxmox username (e.g. root@pam)"
}

variable "proxmox_password" {
  type        = string
  description = "Proxmox password"
  sensitive   = true
}

variable "root_password" {
  type        = string
  description = "Root password for the LXC containers"
  sensitive   = true
}
