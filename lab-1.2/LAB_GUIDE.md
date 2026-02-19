## LAB 1.2: Desplegando Entornos de Producción y Pre-producción en Proxmox con Terraform 🚀

### Introducción: El porqué de este laboratorio
En la administración de sistemas, un entorno de **Pre-producción (Staging)** es tu red de seguridad. Cuando introducimos **Infraestructura como Código (IaC)**, esta necesidad se multiplica: un error de sintaxis o lógica en el código puede destruir una infraestructura en segundos. Pre-producción nos permite probar nuestro código Terraform en un entorno seguro antes de tocar Producción.

En la era de IaC, ya no se lleva el "clon exacto" con la misma IP haciendo malabares con VLANs aisladas. La verdadera magia de Terraform es la **modularidad**. Podemos tener redes distintas y direccionamientos diferentes gestionados dinámicamente utilizando exactamente el mismo código base. En este laboratorio, veremos cómo hacerlo en Proxmox.

### 🛠️ Prerrequisitos (Antes de empezar)
Para que puedas seguir este laboratorio en tu propio entorno, necesitarás:
1. **Terraform instalado** en tu máquina local.
2. **Proxmox VE** funcionando.
3. **Una plantilla LXC descargada:** En tu Proxmox, ve a tu almacenamiento local (ej. `local`), sección *CT Templates* y descarga una plantilla (en este lab usamos Alpine Linux: `alpine-3.23-default_20260116_amd64.tar.xz`).
4. **Credenciales:** Usuario y contraseña de Proxmox. (Consejo: Nunca subas tu contraseña al repositorio. Pásala como variable de entorno usando `export TF_VAR_pm_password="tu-password"`).

---

### Paso 1: Diseño y Preparación de la Red en Proxmox
Antes de tocar código, separamos lógicamente los entornos en el hipervisor creando dos puentes de red virtuales (*Linux Bridges* o `vmbr`).



1. Entra en tu nodo de Proxmox > **Network**.
2. Crea un `vmbr` para **Producción** (ej. `vmbr1001` con rango `100.21.1.0/24`).
3. Crea un `vmbr` para **Pre-producción** (ej. `vmbr2001` con rango `100.22.1.0/24`).

> **Nota:** Adapta los nombres de los bridges y los rangos IP a la topología real de tu laboratorio, este lab tiene un total de 6 vmbr, 3 para produccion y otros 3 para pre-produccion.

### Paso 2: Clonar y Entender la Estructura (Terraform)
No escribimos el código dos veces; escribimos un **módulo base** y lo llamamos pasándole variables distintas según el entorno. 

Clona el repositorio base para ver la estructura:
```bash
git clone [https://github.com/glmbxecurity/devops-labs.git](https://github.com/glmbxecurity/devops-labs.git)
```

La estructura clave es esta:
```text
.
├── pre-produccion/
│   └── terraform/
│       ├── main.tf
│       └── terraform.tfvars
├── produccion/
│   └── terraform/
│       ├── main.tf
│       └── terraform.tfvars
└── terraform_modules/
    └── lxc_basic/           # Nuestro módulo base agnóstico
        ├── main.tf
        └── variables.tf
```

### Paso 3: Analizando el Módulo Base (Agnóstico)
Para que esto funcione, nuestro módulo LXC debe ser agnóstico y aceptar la red y la IP como variables, sin saber de antemano a qué entorno va destinado.

```hcl
# terraform_modules/lxc_basic/variables.tf
variable "vmnet" { default = "vmbr0" } # El bridge de red se inyectará dinámicamente
variable "ip_address" {}               # La IP se inyectará dinámicamente

# terraform_modules/lxc_basic/main.tf
resource "proxmox_lxc" "generic" {
  # ... (configuraciones de CPU, RAM, disco omitidas para brevedad) ...

  network {
    name   = "eth0"
    bridge = var.vmnet      # Aquí Terraform inyectará la red de Prod o Pre
    ip     = var.ip_address # Aquí pondrá la IP correspondiente
    gw     = var.gateway
  }
}
```
*Nota: Puedes revisar el módulo con todas sus opciones avanzadas (mountpoints, docker enable) en el [repositorio de GitHub](https://github.com/glmbxecurity/devops-labs).*

### Paso 4: Configurar los Entornos y Desplegar
Vamos a ver cómo inyectar las variables fijándonos en un servicio de ejemplo: nuestro servidor de Soporte.

#### 4.1. Desplegando Pre-producción
Navegamos al directorio de `pre-produccion/terraform`. Aquí le decimos a Terraform que use el puente de red de pruebas (`vmbr2001`) y un prefijo `pre-` en el hostname para identificarlo.

```hcl
# pre-produccion/terraform/terraform.tfvars

# --- RED Y TEMPLATE ---
bridge_support = "vmbr2001"
template_name  = "local:vztmpl/alpine-3.23-default_20260116_amd64.tar.xz"

# --- SERVICIOS: SOPORTE ---
srv_support_01_id       = "2100"               # Rango de IDs de Pre
srv_support_01_ip       = "100.22.1.10/24"     # Rango IP de Pre-producción
srv_support_01_hostname = "pre-srv-support-01" # Prefijo "pre-"
```

Ejecutamos los comandos mágicos:
```bash
cd pre-produccion/terraform
terraform init
terraform apply -auto-approve
```
Verificamos en Proxmox que el contenedor está corriendo en la red correcta. ¡Infraestructura de pruebas validada!

#### 4.2. Promoción a Producción
Como el despliegue en Pre-producción ha sido un éxito, vamos al directorio de `produccion/terraform`, donde las variables apuntan a nuestra red "real" (`vmbr1001`).

```hcl
# produccion/terraform/terraform.tfvars

# --- RED Y TEMPLATE ---
bridge_support = "vmbr1001"
template_name  = "local:vztmpl/alpine-3.23-default_20260116_amd64.tar.xz"

# --- SERVICIOS: SOPORTE ---
srv_support_01_id       = "1100"           # ID de Producción
srv_support_01_ip       = "100.21.1.10/24" # Rango IP real de Producción
srv_support_01_hostname = "srv-support-01" # Hostname limpio
```

Repetimos el proceso de despliegue:
```bash
cd ../../produccion/terraform
terraform init
terraform apply -auto-approve
```
¡Listo! Dos entornos idénticos a nivel de arquitectura, utilizando el mismo código, pero perfectamente aislados a nivel de red y recursos.

### Conclusión y Siguientes Pasos
Hemos demostrado cómo Terraform facilita la creación de infraestructuras modulares, reutilizables y seguras. Al abstraer la creación de las máquinas en un módulo (como nuestro `lxc_basic`), evitamos duplicar código y reducimos el riesgo de errores humanos al pasar a Producción.

El siguiente paso lógico es utilizar **Ansible** para aprovisionar estos servidores recién creados. De hecho, si revisas mi código, verás que Terraform ya genera automáticamente el inventario de Ansible (`ansible_inventory.tf`) basándose en las IPs desplegadas. ¡Pero eso lo dejaremos para el próximo laboratorio!

El código completo de este proyecto **está disponible en mi repositorio:** [https://github.com/glmbxecurity/devops-labs](https://github.com/glmbxecurity/devops-labs). ¡Siéntete libre de hacer un fork, darle una estrella y adaptarlo a tu propio Proxmox!