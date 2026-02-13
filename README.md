# 🛠️ DevOps Labs

Bienvenido a **DevOps Labs**, un espacio dedicado al aprendizaje práctico de herramientas y metodologías en el ecosistema DevOps. 

Este repositorio centraliza una serie de laboratorios diseñados para transicionar del enfoque de "SysAdmin Artesano" hacia la **Gestión de Infraestructura Automatizada, Declarativa y Escalable**.

## 🚀 Laboratorios Disponibles

### 🔹 [Lab 1: Infraestructura como Código con Terraform y Proxmox](./lab-1/LAB_GUIDE.md)
En este primer laboratorio, sentamos las bases de la automatización desplegando infraestructura de forma declarativa sobre un entorno Proxmox.

### 🔹 [Lab 2: Automatización, Persistencia y Configuración con Ansible](./lab-2/LAB_GUIDE.md)
Continuamos la automatización configurando el almacenamiento persistente mapeado desde Proxmox y preparando los contenedores para su gestión avanzada con Ansible.

*   **Conceptos:** Persistencia de datos con *Bind Mounts*, segmentación de red con *VMBR* y preparación para *Ansible*.
*   **Objetivo:** Configurar contenedores LXC con almacenamiento dedicado en `/data` para despliegues de Docker persistentes.

---

## 📅 Hoja de Ruta (Roadmap)
Iremos ampliando el repositorio con nuevos desafíos de forma progresiva:

*   **Lab 2:** Automatización de configuración con **Ansible** (Configuración de servicios dentro de los LXC).
*   **Lab 3:** Integración Continua (CI) con **GitHub Actions**.
*   **Lab 4:** Observabilidad (I): Monitorización con **Prometheus** y **Grafana**.
*   **Lab 5:** Observabilidad (II): Centralización de Logs con **Loki** y **Promtail**.
*   **Lab 6:** Seguridad: Gestión de secretos con **SOPS** o **HashiCorp Vault**.
*   **Lab 7:** Orquestación: Despliegue de un clúster ligero con **K3s**.

---
*¡A darle caña!* 🚀