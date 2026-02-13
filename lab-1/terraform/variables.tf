variable "proxmox_host" {}
variable "template_name" {}
variable "global_gateway" {}
variable "ssh_key_public" {}

# Variables Básico
variable "basic_id" {}
variable "basic_ip" {}

# Variables Avanzado
variable "adv_bridge" {}
variable "adv_id" {}
variable "adv_ip" {}
variable "adv_cores" {}
variable "adv_ram" {}
# Variables para el Mountpoint (individuales para más claridad)
variable "adv_mount_key"     { default = "0" }
variable "adv_mount_slot"    { default = 0 }
variable "adv_mount_storage" { description = "Ruta en el Host Proxmox" }
variable "adv_mount_mp"      { description = "Ruta en el Container" }
variable "adv_mount_size"    { default = "0G" }

# Secretos (Token API)
variable "pm_user" {
  description = "Usuario de Proxmox (IMPORTANTE: formato user@realm, ej: root@pam)"
  type        = string
  sensitive   = true
}

variable "pm_password" {
  description = "La contraseña de acceso al panel web"
  type        = string
  sensitive   = true
}

# La URL se queda igual
variable "pm_api_url" { type = string }
