# --- GLOBALES ---
variable "proxmox_host" { description = "Nodo de Proxmox destino" }
variable "template_name" { description = "Plantilla LCX/VM base" }
variable "ssh_key_public" { description = "Clave pública SSH para provisión" }

# --- CONEXIÓN PROXMOX ---
variable "pm_api_url" { type = string }
variable "pm_user" { 
  type      = string
  sensitive = true 
}
variable "pm_password" { 
  type      = string
  sensitive = true 
}

# --- RED: BRIDGES ---
variable "bridge_support" { description = "Bridge para red Support" }
variable "bridge_infra"   { description = "Bridge para red Infra" }
variable "bridge_ia"      { description = "Bridge para red IA" }
variable "bridge_soc"     { description = "Bridge para red SOC" }
variable "bridge_labs"    { description = "Bridge para red Labs" }

# --- RED: GATEWAYS ---
variable "gateway_support" { description = "GW para red Support" }
variable "gateway_infra"   { description = "GW para red Infra" }
variable "gateway_ia"      { description = "GW para red IA" }
variable "gateway_soc"     { description = "GW para red SOC" }
variable "gateway_labs"    { description = "GW para red Labs" }

# --- SERVICIOS: SOPORTE ---
variable "srv_support_01_id" {}
variable "srv_support_01_ip" {}
variable "srv_support_01_hostname" { default = "srv-support-01" }
variable "srv_support_01_cores" { default = 1 }
variable "srv_support_01_ram" { default = 512 }
variable "srv_support_01_password" {}
variable "srv_support_01_storage_location" {}
variable "srv_support_01_disk_size" {}
variable "srv_support_01_mount_storage" { description = "Ruta Host (RAID1)" }
variable "srv_support_01_mount_mp" { default = "/app" }

# --- SERVICIOS: VARIOS (INFRA) ---
variable "srv_servicios_varios_01_id" {}
variable "srv_servicios_varios_01_ip" {}
variable "srv_servicios_varios_01_hostname" { default = "srv-servicios-varios-01" }
variable "srv_servicios_varios_01_cores" { default = 1 }
variable "srv_servicios_varios_01_ram" { default = 512 }
variable "srv_servicios_varios_01_password" {}
variable "srv_servicios_varios_01_storage_location" {}
variable "srv_servicios_varios_01_disk_size" {}
variable "srv_servicios_varios_01_mount_storage" {}
variable "srv_servicios_varios_01_mount_mp" { default = "/app" }

# --- SERVICIOS: DEVOPS (INFRA) ---
variable "srv_devops_01_id" {}
variable "srv_devops_01_ip" {}
variable "srv_devops_01_hostname" { default = "srv-devops-01" }
variable "srv_devops_01_cores" { default = 1 }
variable "srv_devops_01_ram" { default = 512 }
variable "srv_devops_01_password" {}
variable "srv_devops_01_storage_location" {}
variable "srv_devops_01_disk_size" {}
variable "srv_devops_01_mount_storage" {}
variable "srv_devops_01_mount_mp" { default = "/app" }

# --- SERVICIOS: VPN (INFRA) ---
variable "srv_vpn_01_id" {}
variable "srv_vpn_01_ip" {}
variable "srv_vpn_01_hostname" { default = "srv-vpn-01" }
variable "srv_vpn_01_cores" { default = 1 }
variable "srv_vpn_01_ram" { default = 512 }
variable "srv_vpn_01_password" {}
variable "srv_vpn_01_storage_location" {}
variable "srv_vpn_01_disk_size" {}
variable "srv_vpn_01_mount_storage" {}
variable "srv_vpn_01_mount_mp" { default = "/app" }

# --- SERVICIOS: IA ---
variable "srv_ia_01_id" {}
variable "srv_ia_01_ip" {}
variable "srv_ia_01_hostname" { default = "srv-ia-01" }
variable "srv_ia_01_cores" { default = 1 }
variable "srv_ia_01_ram" { default = 512 }
variable "srv_ia_01_password" {}
variable "srv_ia_01_storage_location" {}
variable "srv_ia_01_disk_size" {}
variable "srv_ia_01_mount_storage" {}
variable "srv_ia_01_mount_mp" { default = "/app" }
