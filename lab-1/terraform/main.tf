# --- LLAMADA 1: EL BÁSICO ---
module "lxc_wireguard" {
  source = "./modules/lxc_basic"

  # Solo lo obligatorio
  target_node = var.proxmox_host
  vmid        = var.basic_id
  hostname    = "srv-basico"
  ip_address  = var.basic_ip
  ostemplate  = var.template_name
  password    = "passwordTemporal"
  ssh_key     = var.ssh_key_public
  gateway     = var.global_gateway

  # No pasamos ni cores, ni ram, ni mounts.
  # El módulo usará sus defaults (1 Core, 512MB, Sin Docker).
}

# --- LLAMADA 2: EL AVANZADO ---
module "lxc_docker_full" {
  source = "./modules/lxc_basic"

  # Obligatorio
  target_node = var.proxmox_host
  vmid        = var.adv_id
  hostname    = "srv-docker-prod"
  ip_address  = var.adv_ip
  ostemplate  = var.template_name
  password    = "passwordTemporal"
  ssh_key     = var.ssh_key_public
  gateway     = var.global_gateway
  vmnet       = var.adv_bridge
  # Personalización (Sobrescribimos defaults)
  cores       = var.adv_cores
  memory      = var.adv_ram
  disk_size   = "10G"
  
  # Activamos Docker
  docker_enabled = true 
  
  # Pasamos la persistencia construyendo la lista al vuelo
  mountpoints    = [
    {
      key     = var.adv_mount_key
      slot    = var.adv_mount_slot
      storage = var.adv_mount_storage
      mp      = var.adv_mount_mp
      size    = var.adv_mount_size
    }
  ]
}
