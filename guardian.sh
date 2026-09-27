#!/bin/bash

# Definimos una variable para el nombre de nuestro archivo de auditoría
ARCHIVO_LOG="incidentes.log"

echo "Iniciando Perro Guardián de Base de Datos..."
echo "Guardando registro de caídas en el archivo: $ARCHIVO_LOG"
echo "Presiona Ctrl+C para detener."

while true; do
    if ! docker ps | grep -q "bd-junji"; then
        FECHA=$(date '+%Y-%m-%d %H:%M:%S')
        
        # 1. Mostramos la alerta visual en la consola
        echo "[$FECHA] ¡ALERTA CRÍTICA! Base de datos caída."
        
        # 2. Escribimos la evidencia en el archivo de texto usando ">>"
        echo "[$FECHA] INCIDENTE: bd-junji dejó de responder. Iniciando recuperación automática." >> $ARCHIVO_LOG
        
        # 3. Ejecutamos la recuperación
        docker start bd-junji
        
        echo "[$FECHA] Servicio restaurado exitosamente."
        echo "[$FECHA] RESOLUCIÓN: Servicio levantado por el guardián." >> $ARCHIVO_LOG
        echo "---------------------------------------------------"
    fi
    sleep 5
done

