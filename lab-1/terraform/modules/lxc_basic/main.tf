terraform {
  required_providers {
    proxmox = { source = "telmate/proxmox" }
  }
}

resource "proxmox_lxc" "generic" {
  target_node  = var.target_node
  hostname     = var.hostname
  vmid         = var.vmid
  ostemplate   = var.ostemplate
  password     = var.password
  unprivileged = true
  start        = true
  
  # Recursos
  cores  = var.cores
  memory = var.memory
  swap   = 512
  
  rootfs {
    storage = "local-lvm"
    size    = var.disk_size
  }

  network {
    name   = "eth0"
    bridge = var.vmnet
    ip     = var.ip_address
    gw     = var.gateway
  }

  ssh_public_keys = var.ssh_key

  # --- MAGIA 1: Features condicionales ---
  features {
    nesting = var.docker_enabled
    keyctl  = var.docker_enabled
  }

  # --- MAGIA 2: Mountpoints Dinámicos ---
  # Solo crea esto si le pasamos una lista en la variable mountpoints
  dynamic "mountpoint" {
    for_each = var.mountpoints
    content {
      key     = mountpoint.value["key"]
      slot    = mountpoint.value["slot"]
      storage = mountpoint.value["storage"]
      mp      = mountpoint.value["mp"]
      size    = mountpoint.value["size"]
      volume  = mountpoint.value["storage"] # Necesario para Bind Mounts
    }
  }
}
