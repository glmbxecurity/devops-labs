variable "proxmox_host" {}
variable "template_name" {}
variable "global_gateway" {}
variable "ssh_key_public" {}

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

# Variables Bridge
variable "bridge_1001" {}
variable "bridge_1002" {}
variable "bridge_1003" {}
variable "gateway_1001" {}
variable "gateway_1002" {}
variable "gateway_1003" {}




# Variables srv_support_01
variable "srv_support_01_id" {}
variable "srv_support_01_ip" {}

variable "srv_support_01_cores" { default = 1 }
variable "srv_support_01_ram" { default = 512 }
variable "srv_support_01_password" {}
variable "srv_support_01_mount_key"     { default = "0" }
variable "srv_support_01_mount_slot"    { default = 0 }
variable "srv_support_01_mount_storage" { description = "Ruta en el Host Proxmox" }
variable "srv_support_01_mount_mp"      { description = "Ruta en el Container" }
variable "srv_support_01_mount_size"    { default = "0G" }
variable "srv_support_01_storage_location" {}
variable "srv_support_01_disk_size" {}

# Variables srv_servicios_varios_01
variable "srv_servicios_varios_01_id" {}
variable "srv_servicios_varios_01_ip" {}

variable "srv_servicios_varios_01_cores" { default = 1 }
variable "srv_servicios_varios_01_ram" { default = 512 }
variable "srv_servicios_varios_01_password" {}
variable "srv_servicios_varios_01_mount_key"     { default = "0" }
variable "srv_servicios_varios_01_mount_slot"    { default = 0 }
variable "srv_servicios_varios_01_mount_storage" { description = "Ruta en el Host Proxmox" }
variable "srv_servicios_varios_01_mount_mp"      { description = "Ruta en el Container" }
variable "srv_servicios_varios_01_mount_size"    { default = "0G" }
variable "srv_servicios_varios_01_storage_location" {}
variable "srv_servicios_varios_01_disk_size" {}

# variables srv_devops_01
variable "srv_devops_01_id" {}
variable "srv_devops_01_ip" {}

variable "srv_devops_01_cores" { default = 1 }
variable "srv_devops_01_ram" { default = 512 }
variable "srv_devops_01_password" {}
variable "srv_devops_01_mount_key"     { default = "0" }
variable "srv_devops_01_mount_slot"    { default = 0 }
variable "srv_devops_01_mount_storage" { description = "Ruta en el Host Proxmox" }
variable "srv_devops_01_mount_mp"      { description = "Ruta en el Container" }
variable "srv_devops_01_mount_size"    { default = "0G" }
variable "srv_devops_01_storage_location" {}
variable "srv_devops_01_disk_size" {}

# Variables srv_vpn_01
variable "srv_vpn_01_id" {}
variable "srv_vpn_01_ip" {}

variable "srv_vpn_01_cores" { default = 1 }
variable "srv_vpn_01_ram" { default = 512 }
variable "srv_vpn_01_password" {}
variable "srv_vpn_01_mount_key"     { default = "0" }
variable "srv_vpn_01_mount_slot"    { default = 0 }
variable "srv_vpn_01_mount_storage" { description = "Ruta en el Host Proxmox" }
variable "srv_vpn_01_mount_mp"      { description = "Ruta en el Container" }
variable "srv_vpn_01_mount_size"    { default = "0G" }
variable "srv_vpn_01_storage_location" {}
variable "srv_vpn_01_disk_size" {}

# Variables srv_ia_01
variable "srv_ia_01_id" {}
variable "srv_ia_01_ip" {}

variable "srv_ia_01_cores" { default = 1 }
variable "srv_ia_01_ram" { default = 512 }
variable "srv_ia_01_password" {}
variable "srv_ia_01_mount_key"     { default = "0" }
variable "srv_ia_01_mount_slot"    { default = 0 }
variable "srv_ia_01_mount_storage" { description = "Ruta en el Host Proxmox" }
variable "srv_ia_01_mount_mp"      { description = "Ruta en el Container" }
variable "srv_ia_01_mount_size"    { default = "0G" }
variable "srv_ia_01_storage_location" {}
variable "srv_ia_01_disk_size" {}

