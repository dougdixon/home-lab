locals {
  template_file_id = "local:vztmpl/rockylinux-10-default_20251001_amd64.tar.xz"
  gateway          = "192.168.10.1"
  bridge           = "vmbr0"
  datastore_id     = "local-lvm"
  cores            = 2
  memory           = 4096
  disk_size        = 40
  ssh_public_keys  = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsfZE00IImRkErluhxTx+5yfQ+eyxAPOJ2LAJrSQB2cR/9+eEegV7SRMQq762QuDXRBqrdH8sNsLDxZvoLd0xEwRePbLR1FTRPdpaaFqwnwqEZaJpdFJbUCDNblVwXuLx+urK1q8zG3rzR9dyC/pdKeDCpCRHs2CrcT72JAZ5pAtEDjbBEK6u33X5s2JE4QPYXO7RRG2LqSRBbI+4fqYwtmq0lM6GQvBt5DFQOjOeWTYIrVmpdd08E74svkVqqYaTaCWtSaZlYPt1aeFEIRL/co2mdgmveFwCDUynHXozFKIQ71HcjEdB+TCJV/nuI1dQuzjcio/nNn1WG1F+w0PsljkV1SAE09kgWXejDXO4M9tKIww3hjPMcMwPeqcxjs2EPIthyyMYq5UayatmTlNQ+Jps4APJ7cIJHIKW5+QTZsSJmsW4hD5EpjsUfHT+YCIYxcXOKXiIOu6ApMvTapOq+Gn5GfP39zszgWG4K/9hqxs1Ersa5VQXry/y1+zJFUys= ddixon@ansible.home.dixonnet.org"]
}

module "auth1" {
  source = "../modules/lxc"

  node_name        = "nuc1"
  vm_id            = 10041
  hostname         = "auth1"
  template_file_id = local.template_file_id
  cores            = local.cores
  memory           = local.memory
  disk_size        = local.disk_size
  datastore_id     = local.datastore_id
  bridge           = local.bridge
  ip_address       = "192.168.10.41/23"
  gateway          = local.gateway
  root_password    = var.root_password
  ssh_public_keys  = local.ssh_public_keys
}

module "auth2" {
  source = "../modules/lxc"

  node_name        = "nuc2"
  vm_id            = 10042
  hostname         = "auth2"
  template_file_id = local.template_file_id
  cores            = local.cores
  memory           = local.memory
  disk_size        = local.disk_size
  datastore_id     = local.datastore_id
  bridge           = local.bridge
  ip_address       = "192.168.10.42/23"
  gateway          = local.gateway
  root_password    = var.root_password
  ssh_public_keys  = local.ssh_public_keys
}
