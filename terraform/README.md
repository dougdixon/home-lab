# Terraform — Home Lab Infrastructure

Terraform configurations for provisioning home lab infrastructure on Proxmox using the [bpg/proxmox](https://github.com/bpg/terraform-provider-proxmox) provider.

## Directory Structure

```
terraform/
├── modules/
│   └── lxc/          # Reusable module for Proxmox LXC containers
└── ipa/              # FreeIPA server containers (ipa1, ipa2)
```

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.0
- Proxmox VE with API access enabled
- Rocky Linux template `rockylinux-10-default_20251001_amd64.tar.xz` downloaded to the `local` storage on each target node

## Deployments

### IPA (FreeIPA)

Two LXC containers running Rocky Linux 10, deployed across two Proxmox nodes.

| Name | VM ID | Node | IP              | CPU | Memory | Disk |
|------|-------|------|-----------------|-----|--------|------|
| ipa1 | 10041 | nuc1 | 192.168.10.41/23 | 2   | 4 GB   | 40 GB |
| ipa2 | 10042 | nuc2 | 192.168.10.42/23 | 2   | 4 GB   | 40 GB |

#### 1. Configure variables

Edit `ipa/terraform.tfvars` and set your Proxmox API endpoint:

```hcl
proxmox_endpoint = "https://192.168.10.X:8006"
proxmox_username = "root@pam"
```

#### 2. Set sensitive variables via environment variables

```bash
export TF_VAR_proxmox_password="<your-proxmox-password>"
export TF_VAR_root_password="<container-root-password>"
```

#### 3. Initialize and deploy

```bash
cd terraform/ipa
terraform init
terraform plan
terraform apply
```

#### 4. Destroy

```bash
terraform destroy
```

## Modules

### `modules/lxc`

A reusable module for creating Proxmox LXC containers.

| Variable          | Type   | Default     | Description                              |
|-------------------|--------|-------------|------------------------------------------|
| `node_name`       | string |             | Proxmox node to deploy on                |
| `vm_id`           | number |             | Container VM ID                          |
| `hostname`        | string |             | Container hostname                       |
| `template_file_id`| string |             | Template file ID on the Proxmox node     |
| `ip_address`      | string |             | Static IP with CIDR (e.g. 10.0.0.1/24)  |
| `gateway`         | string |             | Default gateway                          |
| `root_password`   | string |             | Root password (sensitive)                |
| `cores`           | number | `1`         | Number of CPU cores                      |
| `memory`          | number | `512`       | Memory in MB                             |
| `disk_size`       | number | `8`         | Root disk size in GB                     |
| `datastore_id`    | string | `local-lvm` | Proxmox storage location                 |
| `bridge`          | string | `vmbr0`     | Network bridge                           |
| `unprivileged`    | bool   | `true`      | Run as unprivileged container            |
