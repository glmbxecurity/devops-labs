# Lab 2: Automatización, Persistencia y Configuración con Ansible

## 1. Introducción: De la Infraestructura a la Configuración

Este laboratorio es una continuación directa del **Lab 1**. Si has llegado aquí sin pasar por el primero, te recomendamos encarecidamente revisarlo, ya que no nos detendremos a explicar conceptos básicos de Terraform o Proxmox que ya cubrimos allí.

En este nivel, elevamos la apuesta: ya no solo queremos "desplegar máquinas", queremos **gestionar su ciclo de vida y sus datos**. Pasamos de la creación pura a la configuración automatizada.

---

## 2. Preparación de la Red (Manual)

Antes de lanzar Terraform, hemos preparado el terreno en Proxmox. Para segmentar correctamente nuestros servicios, hemos creado manualmente **3 nuevos puentes (vmbr)**:

- **vmbr1001:** Red de soporte y servicios troncales.
- **vmbr1002:** Red de DevOps y VPN.
- **vmbr1003:** Red para experimentos de IA.

Esto nos permite un control granular del tráfico entre laboratorios.

---

## 3. Despliegue de la Infraestructura (Terraform)

Siguiendo la metodología del Lab 1, hemos desplegado **5 nuevos contenedores LXC**:

1.  `srv-support-01`
2.  `srv-servicios-varios-01`
3.  `srv-devops-01`
4.  `srv-vpn-01`
5.  `srv-ia-01`

Cada uno de estos contenedores ha sido inyectado con los mismos principios: declarativos, modulares y listos para ser configurados.

> [!NOTE]
> Todo el código de Terraform utilizado para este despliegue se encuentra dentro de la carpeta [terraform/](./terraform/) de este laboratorio. No incluiremos los bloques de código extensos aquí para mantener la guía concisa y enfocada en los objetivos de configuración.

---

## 4. El Reto de la Persistencia: Bind Mounts

Aquí es donde entra la novedad técnica. Un contenedor es efímero; si muere, sus datos mueren con él si no tomamos medidas. 

Para solucionar esto, hemos configurado **Bind Mounts** dedicados desde el host Proxmox hacia cada LXC. Terraform se encarga de mapear un directorio físico del servidor hacia la carpeta `/data` interna de cada contenedor.

**¿Por qué `/data`?** 
Porque queremos una ubicación estandarizada. Todos nuestros servicios guardarán sus configuraciones y volúmenes allí. De esta forma, si el contenedor se destruye, los datos siguen seguros en el almacenamiento de Proxmox.

---

## 5. Próximos Pasos: Configuración con Ansible

Tener los contenedores y el disco montado es solo el 50% del trabajo. El siguiente paso es entrar en el terreno de **Ansible**.

Nuestro objetivo con Ansible será:
1.  Instalar Docker dentro de estos LXC de forma automatizada.
2.  Configurar el motor de Docker para que, por defecto, utilice el directorio `/data` montado para almacenar sus volúmenes y contenedores.
3.  Asegurar que cualquier despliegue posterior sea totalmente persistente y reproducible.

---
🚀 **¡Manos a la obra!** Pasamos de ser Arquitectos de Infraestructura a ser Ingenieros de Configuración.
