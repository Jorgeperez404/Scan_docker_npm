🚀 Cómo Ejecutar los Escaneos
Asegúrate de tener Docker y npm instalados y funcionando.

1. Escaneo de Dependencias de Node.js (npm)
# Audita y reporta vulnerabilidades
npm audit

# Audita e intenta corregir automáticamente las vulnerabilidades menores
npm audit fix

Escaneo Avanzado con Dependency-Check (Docker + CLI)
docker run --rm \
    -v $(pwd):/src \
    owasp/dependency-check \
    --scan /src \
    --format ALL \
    --project "Mi Proyecto Escaneo" \
    --out /src/reports

📝 Revisión de Resultados
Tras ejecutar el escaneo con Dependency-Check, revisa la carpeta reports creada en tu directorio local.
Abre el archivo reports/dependency-check-report.html en tu navegador para ver un resumen visual de todas las vulnerabilidades (CVEs) detectadas, su nivel de riesgo (CVSS Score), y las dependencias afectadas.
<img width="1366" height="656" alt="Resultado_npm" src="https://github.com/user-attachments/assets/0c2f43ab-f2dc-4bc2-9f63-0eaa48d91c96" />
<img width="1366" height="623" alt="Resultado_docker" src="https://github.com/user-attachments/assets/6d0a2ae6-d3cd-423b-a401-6619a78d018d" />



