locals {
  template_file_id = "local:vztmpl/rockylinux-10-default_20251001_amd64.tar.xz"
  gateway          = "192.168.10.1"
  bridge           = "vmbr0"
  datastore_id     = "local-lvm"
  cores            = 2
  memory           = 4096
  disk_size        = 40
}

module "ipa1" {
  source = "../modules/lxc"

  node_name        = "nuc1"
  vm_id            = 10041
  hostname         = "ipa1"
  template_file_id = local.template_file_id
  cores            = local.cores
  memory           = local.memory
  disk_size        = local.disk_size
  datastore_id     = local.datastore_id
  bridge           = local.bridge
  ip_address       = "192.168.10.41/23"
  gateway          = local.gateway
  root_password    = var.root_password
}

module "ipa2" {
  source = "../modules/lxc"

  node_name        = "nuc2"
  vm_id            = 10042
  hostname         = "ipa2"
  template_file_id = local.template_file_id
  cores            = local.cores
  memory           = local.memory
  disk_size        = local.disk_size
  datastore_id     = local.datastore_id
  bridge           = local.bridge
  ip_address       = "192.168.10.42/23"
  gateway          = local.gateway
  root_password    = var.root_password
}
