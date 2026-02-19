# --- LXC: srv_support_01 ---
module "srv_support_01" {
  source = "../../terraform_modules/lxc_basic"

  target_node = var.proxmox_host
  vmid        = var.srv_support_01_id
  hostname    = var.srv_support_01_hostname
  ip_address  = var.srv_support_01_ip
  ostemplate  = var.template_name
  password    = var.srv_support_01_password
  ssh_key     = var.ssh_key_public
  storage_location = var.srv_support_01_storage_location
  disk_size   = var.srv_support_01_disk_size
  gateway     = var.gateway_support
  vmnet       = var.bridge_support
  cores       = var.srv_support_01_cores
  memory      = var.srv_support_01_ram
  docker_enabled = true 
  mountpoints    = [
    {
      key     = "0"
      slot    = 0
      storage = var.srv_support_01_mount_storage
      mp      = var.srv_support_01_mount_mp
      size    = "0G" # Size is ignored for bind mounts but required by type
    }
  ]
}

# --- LXC: srv_servicios_varios_01 ---
module "srv_servicios_varios_01" {
  source = "../../terraform_modules/lxc_basic"

  target_node = var.proxmox_host
  vmid        = var.srv_servicios_varios_01_id
  hostname    = var.srv_servicios_varios_01_hostname
  ip_address  = var.srv_servicios_varios_01_ip
  ostemplate  = var.template_name
  password    = var.srv_servicios_varios_01_password
  ssh_key     = var.ssh_key_public
  storage_location = var.srv_servicios_varios_01_storage_location
  disk_size   = var.srv_servicios_varios_01_disk_size
  gateway     = var.gateway_infra
  vmnet       = var.bridge_infra
  cores       = var.srv_servicios_varios_01_cores
  memory      = var.srv_servicios_varios_01_ram
  docker_enabled = true 
  mountpoints    = [
    {
      key     = "0"
      slot    = 0
      storage = var.srv_servicios_varios_01_mount_storage
      mp      = var.srv_servicios_varios_01_mount_mp
      size    = "0G"
    }
  ]
}

# --- LXC: srv_devops_01 ---
module "srv_devops_01" {
  source = "../../terraform_modules/lxc_basic"

  target_node = var.proxmox_host
  vmid        = var.srv_devops_01_id
  hostname    = var.srv_devops_01_hostname
  ip_address  = var.srv_devops_01_ip
  ostemplate  = var.template_name
  password    = var.srv_devops_01_password
  ssh_key     = var.ssh_key_public
  storage_location = var.srv_devops_01_storage_location
  disk_size   = var.srv_devops_01_disk_size
  gateway     = var.gateway_infra
  vmnet       = var.bridge_infra
  cores       = var.srv_devops_01_cores
  memory      = var.srv_devops_01_ram
  docker_enabled = true 
  mountpoints    = [
    {
      key     = "0"
      slot    = 0
      storage = var.srv_devops_01_mount_storage
      mp      = var.srv_devops_01_mount_mp
      size    = "0G"
    }
  ]
}

# --- LXC: srv_vpn_01 ---
module "srv_vpn_01" {
  source = "../../terraform_modules/lxc_basic"

  target_node = var.proxmox_host
  vmid        = var.srv_vpn_01_id
  hostname    = var.srv_vpn_01_hostname
  ip_address  = var.srv_vpn_01_ip
  ostemplate  = var.template_name
  password    = var.srv_vpn_01_password
  ssh_key     = var.ssh_key_public
  storage_location = var.srv_vpn_01_storage_location
  disk_size   = var.srv_vpn_01_disk_size
  gateway     = var.gateway_infra
  vmnet       = var.bridge_infra
  cores       = var.srv_vpn_01_cores
  memory      = var.srv_vpn_01_ram
  docker_enabled = true 
  mountpoints    = [
    {
      key     = "0"
      slot    = 0
      storage = var.srv_vpn_01_mount_storage
      mp      = var.srv_vpn_01_mount_mp
      size    = "0G"
    }
  ]
}

# --- LXC: srv_ia_01 ---
module "srv_ia_01" {
  source = "../../terraform_modules/lxc_basic"

  target_node = var.proxmox_host
  vmid        = var.srv_ia_01_id
  hostname    = var.srv_ia_01_hostname
  ip_address  = var.srv_ia_01_ip
  ostemplate  = var.template_name
  password    = var.srv_ia_01_password
  ssh_key     = var.ssh_key_public
  storage_location = var.srv_ia_01_storage_location
  disk_size   = var.srv_ia_01_disk_size
  gateway     = var.gateway_ia
  vmnet       = var.bridge_ia
  cores       = var.srv_ia_01_cores
  memory      = var.srv_ia_01_ram
  docker_enabled = true 
  mountpoints    = [
    {
      key     = "0"
      slot    = 0
      storage = var.srv_ia_01_mount_storage
      mp      = var.srv_ia_01_mount_mp
      size    = "0G"
    }
  ]
}
