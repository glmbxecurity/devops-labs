output "info_completa" {
  description = "Objeto JSON con la configuración total del LXC"
  sensitive   = true
  value = {
    # --- IDENTIFICACIÓN ---
    identidad = {
      id           = proxmox_lxc.generic.vmid
      hostname     = proxmox_lxc.generic.hostname
      nodo_proxmox = proxmox_lxc.generic.target_node
      template     = proxmox_lxc.generic.ostemplate
      unprivileged = proxmox_lxc.generic.unprivileged
    }

    # --- RECURSOS ---
    hardware = {
      cores  = proxmox_lxc.generic.cores
      memory = proxmox_lxc.generic.memory
      swap   = proxmox_lxc.generic.swap
      # Accedemos al primer disco [0] para ver detalles del rootfs
      disco_root = {
        storage = proxmox_lxc.generic.rootfs[0].storage
        size    = proxmox_lxc.generic.rootfs[0].size
      }
    }

    # --- RED (ETH0) ---
    red = {
      ip_cidr = proxmox_lxc.generic.network[0].ip  # Ej: 192.168.1.50/24
      ip_pura = split("/", proxmox_lxc.generic.network[0].ip)[0] # Ej: 192.168.1.50
      gateway = proxmox_lxc.generic.network[0].gw
      bridge  = proxmox_lxc.generic.network[0].bridge
      mac     = proxmox_lxc.generic.network[0].hwaddr # ¡La MAC generada!
    }

    # --- FEATURES (DOCKER / VPN) ---
    # Esto es vital para depurar si Docker no arranca

    # --- PERSISTENCIA (MOUNTPOINTS) ---
    # Devuelve la lista completa de discos extra o bind mounts
    mountpoints = proxmox_lxc.generic.mountpoint

    # --- ACCESO ---
    acceso = {
      ssh_keys_cargadas = length(proxmox_lxc.generic.ssh_public_keys) > 0 ? "SÍ" : "NO"
      password_root     = proxmox_lxc.generic.password # Cuidado, esto mostrará el hash o la pass
      comando_ssh       = "ssh root@${split("/", proxmox_lxc.generic.network[0].ip)[0]}"
    }
  }
  
  # Marcamos esto como sensitive si no quieres que la password salga en logs de CI/CD
  # sensitive = true 
}
