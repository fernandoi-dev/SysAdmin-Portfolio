#!/bin/bash
# Agente automatizado de respaldos (Disaster Recovery)


FECHA=$(date +%Y%m%d_%H%M%S)

DESTINO="/home/mgnl/SysAdminPortfolio/ProyectoGuardian/Respaldos/db_backup_$FECHA.sql.gz"

echo "⏳ Iniciando volcado de base de datos..."


docker exec prod-backend mysqldump -u root -padmin123 --all-databases | gzip > "$DESTINO"

echo "✅ Respaldo comprimido y guardado exitosamente en: $DESTINO"
