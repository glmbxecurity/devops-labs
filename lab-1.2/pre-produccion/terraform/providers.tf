terraform {
  required_providers {
    proxmox = {
      # Este es el proveedor estándar de la comunidad
      source  = "telmate/proxmox"
      version = "2.9.14" # Fijamos versión para evitar sustos en actualizaciones
    }
  }
}

provider "proxmox" {
  # URL de la API (La coge de variables.tf)
  pm_api_url = var.pm_api_url

  # Autenticación (Usuario/Pass en vez de Token)
  pm_user     = var.pm_user
  pm_password = var.pm_password

  # Opciones de seguridad y rendimiento
  pm_tls_insecure = true  # true = Ignorar error de certificado (candado rojo)
  pm_parallel     = 1     # 1 = Crear máquinas de una en una (evita errores de bloqueo en Proxmox)
  
  # Opcional: Si quieres ver muchos logs, descomenta esto:
  # pm_log_enable = true
  # pm_log_file   = "terraform-plugin-proxmox.log"
  # pm_debug      = true
  # pm_log_levels = {
  #   _default = "debug"
  #   _capturelog = ""
  # }
}
