resource "proxmox_virtual_environment_container" "this" {
  node_name    = var.node_name
  vm_id        = var.vm_id
  unprivileged = var.unprivileged
  started      = true

  initialization {
    hostname = var.hostname

    ip_config {
      ipv4 {
        address = var.ip_address
        gateway = var.gateway
      }
    }

    user_account {
      password = var.root_password
    }
  }

  cpu {
    cores = var.cores
  }

  memory {
    dedicated = var.memory
  }

  disk {
    datastore_id = var.datastore_id
    size         = var.disk_size
  }

  network_interface {
    name   = "eth0"
    bridge = var.bridge
  }

  operating_system {
    template_file_id = var.template_file_id
    type             = "centos"
  }
}
