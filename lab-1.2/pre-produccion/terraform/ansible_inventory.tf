resource "local_file" "ansible_inventory" {
  content = <<EOT
# --- INSTRUCCIONES ---
# Si agregas un nuevo módulo en main.tf, debes agregarlo aquí manualmente 
# bajo el grupo que corresponda (support, ia, infra, etc.)
# Formato: nombre-host ansible_host=${module.NOMBRE_MODULO.info_completa.red.ip_pura}

[support]
srv-support-01 ansible_host=${module.srv_support_01.info_completa.red.ip_pura}

[ia]
srv-ia-01 ansible_host=${module.srv_ia_01.info_completa.red.ip_pura}

[infra]
srv-servicios-varios-01 ansible_host=${module.srv_servicios_varios_01.info_completa.red.ip_pura}
srv-devops-01 ansible_host=${module.srv_devops_01.info_completa.red.ip_pura}
srv-vpn-01 ansible_host=${module.srv_vpn_01.info_completa.red.ip_pura}
EOT
  filename = "../ansible/inventory.ini"
}
