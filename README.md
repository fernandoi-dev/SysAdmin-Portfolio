# 🛡️ Sistema de Autorreparación y Auditoría (Self-Healing) para Docker

Este proyecto es una herramienta de operaciones de TI (SRE) diseñada para garantizar la continuidad operativa de bases de datos críticas en contenedores Docker. 

## 📌 El Problema
En infraestructuras institucionales (como procesos de matrícula o portales universitarios), una caída de la base de datos genera bloqueos inmediatos (Error 504) y cuellos de botella. La intervención manual para reiniciar el servicio aumenta significativamente el **MTTR (Mean Time To Recovery)**.

## 🚀 La Solución
Un script de Bash (`guardian.sh`) que actúa como un "perro guardián" (watchdog). Se ejecuta en segundo plano monitoreando los signos vitales del contenedor cada 5 segundos. 

**Características principales:**
1. **Detección Temprana:** Verifica el estado activo del contenedor en el motor de Docker.
2. **Autorreparación (Self-healing):** Si el servicio cae (por falta de memoria o error humano), el script inyecta un comando de encendido automático, restaurando la disponibilidad en menos de 5 segundos.
3. **Auditoría Permanente:** Escribe un registro histórico en `incidentes.log` documentando la fecha, hora exacta del colapso y la confirmación de la resolución para el análisis forense posterior (RCA).

## 🛠️ Tecnologías Utilizadas
* **Lenguaje:** Bash Scripting (Linux)
* **Infraestructura:** Docker / Docker Networks
* **Entorno:** Ubuntu / WSL2

## 📝 Uso
Otorgar permisos de ejecución e iniciar el demonio:
```bash
chmod +x guardian.sh
./guardian.sh
