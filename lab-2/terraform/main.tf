# --- LXC: srv_support_01 ---


module "srv_support_01" {
  source = "./modules/lxc_basic"

  # Obligatorio
  target_node = var.proxmox_host
  vmid        = var.srv_support_01_id
  hostname    = "srv-support-01"
  ip_address  = var.srv_support_01_ip
  ostemplate  = var.template_name
  password    = var.srv_support_01_password
  ssh_key     = var.ssh_key_public
  storage_location = var.srv_support_01_storage_location
  disk_size   = var.srv_support_01_disk_size
  gateway     = var.gateway_1001
  vmnet       = var.bridge_1001
  cores       = var.srv_support_01_cores
  memory      = var.srv_support_01_ram
  docker_enabled = true 
  mountpoints    = [
    {
      key     = var.srv_support_01_mount_key
      slot    = var.srv_support_01_mount_slot
      storage = var.srv_support_01_mount_storage
      mp      = var.srv_support_01_mount_mp
      size    = var.srv_support_01_mount_size
    }
  ]
}

module "srv-servicios-varios-01" {
  source = "./modules/lxc_basic"

  # Obligatorio
  target_node = var.proxmox_host
  vmid        = var.srv_servicios_varios_01_id
  hostname    = "srv-servicios-varios-01"
  ip_address  = var.srv_servicios_varios_01_ip
  ostemplate  = var.template_name
  password    = var.srv_servicios_varios_01_password
  ssh_key     = var.ssh_key_public
  storage_location = var.srv_servicios_varios_01_storage_location
  disk_size   = var.srv_servicios_varios_01_disk_size
  gateway     = var.gateway_1002
  vmnet       = var.bridge_1002
  cores       = var.srv_servicios_varios_01_cores
  memory      = var.srv_servicios_varios_01_ram
  docker_enabled = true 
  mountpoints    = [
    {
      key     = var.srv_servicios_varios_01_mount_key
      slot    = var.srv_servicios_varios_01_mount_slot
      storage = var.srv_servicios_varios_01_mount_storage
      mp      = var.srv_servicios_varios_01_mount_mp
      size    = var.srv_servicios_varios_01_mount_size
    }
  ]
}

module "srv_devops_01" {
  source = "./modules/lxc_basic"
    # Obligatorio
  target_node = var.proxmox_host
  vmid        = var.srv_devops_01_id
  hostname    = "srv-devops-01"
  ip_address  = var.srv_devops_01_ip
  ostemplate  = var.template_name
  password    = var.srv_devops_01_password
  ssh_key     = var.ssh_key_public
  storage_location = var.srv_devops_01_storage_location
  disk_size   = var.srv_devops_01_disk_size
  gateway     = var.gateway_1002
  vmnet       = var.bridge_1002
  cores       = var.srv_devops_01_cores
  memory      = var.srv_devops_01_ram
  docker_enabled = true 
  mountpoints    = [
    {
      key     = var.srv_devops_01_mount_key
      slot    = var.srv_devops_01_mount_slot
      storage = var.srv_devops_01_mount_storage
      mp      = var.srv_devops_01_mount_mp
      size    = var.srv_devops_01_mount_size
    }
  ]

}

module "srv_vpn_01" {
  source = "./modules/lxc_basic"
    # Obligatorio
  target_node = var.proxmox_host
  vmid        = var.srv_vpn_01_id
  hostname    = "srv-vpn-01"
  ip_address  = var.srv_vpn_01_ip
  ostemplate  = var.template_name
  password    = var.srv_vpn_01_password
  ssh_key     = var.ssh_key_public
  storage_location = var.srv_vpn_01_storage_location
  disk_size   = var.srv_vpn_01_disk_size
  gateway     = var.gateway_1001
  vmnet       = var.bridge_1002
  cores       = var.srv_vpn_01_cores
  memory      = var.srv_vpn_01_ram
  docker_enabled = true 
  mountpoints    = [
    {
      key     = var.srv_vpn_01_mount_key
      slot    = var.srv_vpn_01_mount_slot
      storage = var.srv_vpn_01_mount_storage
      mp      = var.srv_vpn_01_mount_mp
      size    = var.srv_vpn_01_mount_size
    }
  ]

}

module "srv_ia_01" {
  source = "./modules/lxc_basic"
    # Obligatorio
  target_node = var.proxmox_host
  vmid        = var.srv_ia_01_id
  hostname    = "srv-ia-01"
  ip_address  = var.srv_ia_01_ip
  ostemplate  = var.template_name
  password    = var.srv_ia_01_password
  ssh_key     = var.ssh_key_public
  storage_location = var.srv_ia_01_storage_location
  disk_size   = var.srv_ia_01_disk_size
  gateway     = var.gateway_1003
  vmnet       = var.bridge_1003
  cores       = var.srv_ia_01_cores
  memory      = var.srv_ia_01_ram
  docker_enabled = true 
  mountpoints    = [
    {
      key     = var.srv_ia_01_mount_key
      slot    = var.srv_ia_01_mount_slot
      storage = var.srv_ia_01_mount_storage
      mp      = var.srv_ia_01_mount_mp
      size    = var.srv_ia_01_mount_size
    }
  ]

}