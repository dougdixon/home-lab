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
      keys     = var.ssh_public_keys
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

  features {
    nesting = true
  }
}

resource "null_resource" "provision" {
  depends_on = [proxmox_virtual_environment_container.this]

  triggers = {
    container_id = proxmox_virtual_environment_container.this.id
  }

  provisioner "local-exec" {
    command = "ssh root@${var.node_name} 'pct exec ${var.vm_id} -- dnf install -y openssh-server && pct exec ${var.vm_id} -- systemctl enable --now sshd'"
  }
}
