output "debug_lxc_simple" {
  description = "Radiografía del servidor VPN/Básico"
  value       = module.lxc_wireguard.info_completa
  sensitive   = true
}

output "debug_lxc_docker" {
  description = "Radiografía del servidor Docker Avanzado"
  value       = module.lxc_docker_full.info_completa
  sensitive   = true
}
