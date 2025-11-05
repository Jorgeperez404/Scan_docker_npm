#!/bin/bash

# ==============================================
# 🔍 Escaneo de vulnerabilidades
# OWASP Dependency-Check + npm audit
# ==============================================

echo "--------------------------------------------"
echo "🚀 Iniciando escaneo de vulnerabilidades..."
echo "--------------------------------------------"

# 📂 Carpeta actual y reportes
SCAN_DIR=$(pwd)
REPORT_DIR=~/dependency-check-report

mkdir -p "$REPORT_DIR"

# ==============================================
# 1️⃣ Escaneo con OWASP Dependency-Check (Docker)
# ==============================================
echo ""
echo "🧱 Ejecutando OWASP Dependency-Check..."
docker run --rm \
  -v "$SCAN_DIR":/src \
  -v "$REPORT_DIR":/report \
  owasp/dependency-check \
  --scan /src \
  --format "HTML" \
  --project "Escaneo de Vulnerabilidades - $(basename "$SCAN_DIR")" \
  --out /report

echo ""
echo "✅ Reporte HTML generado en: $REPORT_DIR/dependency-check-report.html"

# ==============================================
# 2️⃣ Escaneo con npm audit (si aplica ten encuanta que solo funciona con proyectos node)
# ==============================================
if [ -f "$SCAN_DIR/package.json" ]; then
  echo ""
  echo "🧩 Ejecutando npm audit..."
  cd "$SCAN_DIR"
  npm install --no-audit --quiet
  npm audit --json > "$REPORT_DIR/npm-audit-report.json"
  echo "✅ Reporte JSON generado en: $REPORT_DIR/npm-audit-report.json"
else
  echo ""
  echo "⚠️ No se encontró package.json — se omite npm audit."
fi

# ==============================================
# ✅ Finalización
# ==============================================
echo ""
echo "--------------------------------------------"
echo "🎯 Escaneo completado. Revisa los reportes en:"
echo "$REPORT_DIR/"
echo "--------------------------------------------"
