variable "target_node" {}
variable "vmid" {}
variable "hostname" {}
variable "ip_address" {}
variable "password" {}
variable "ssh_key" {}
variable "ostemplate" {}

# --- OPCIONALES CON DEFAULT (Para el LXC Básico) ---
variable "cores" { default = 1 }
variable "memory" { default = 512 }
variable "disk_size" { default = "1G" }
variable "gateway" { default = "192.168.1.1" } # Opcional si usas DHCP, pero aquí lo fijamos
variable "vmnet" { default = "vmbr0" }
# --- FEATURES AVANZADAS (Para el LXC Docker) ---
variable "docker_enabled" { 
  description = "Activa nesting y keyctl"
  default = false 
}

variable "mountpoints" {
  description = "Lista de discos/bind mounts"
  type = list(object({
    key     = string
    slot    = number
    storage = string
    mp      = string
    size    = string
  }))
  default = [] # Por defecto, lista vacía = sin mounts
}
