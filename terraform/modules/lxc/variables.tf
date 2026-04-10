variable "node_name" {
  type        = string
  description = "Proxmox node to deploy the container on"
}

variable "vm_id" {
  type        = number
  description = "Container VM ID"
}

variable "hostname" {
  type        = string
  description = "Container hostname"
}

variable "template_file_id" {
  type        = string
  description = "Template file ID (e.g. local:vztmpl/rockylinux-10-default_20251001_amd64.tar.xz)"
}

variable "cores" {
  type        = number
  description = "Number of CPU cores"
  default     = 1
}

variable "memory" {
  type        = number
  description = "Memory in MB"
  default     = 512
}

variable "disk_size" {
  type        = number
  description = "Root disk size in GB"
  default     = 8
}

variable "datastore_id" {
  type        = string
  description = "Storage location for the disk"
  default     = "local-lvm"
}

variable "bridge" {
  type        = string
  description = "Network bridge"
  default     = "vmbr0"
}

variable "ip_address" {
  type        = string
  description = "Static IP address with CIDR (e.g. 192.168.10.41/23)"
}

variable "gateway" {
  type        = string
  description = "Default gateway"
}

variable "unprivileged" {
  type        = bool
  description = "Run the container in unprivileged mode"
  default     = true
}

variable "os_type" {
  type        = string
  description = "Container OS type (e.g. centos, ubuntu, debian)"
  default     = "centos"
}

variable "root_password" {
  type        = string
  description = "Root password for the container"
  sensitive   = true
}

variable "ssh_public_keys" {
  type        = list(string)
  description = "SSH public keys to add to root's authorized_keys"
  default     = []
}
