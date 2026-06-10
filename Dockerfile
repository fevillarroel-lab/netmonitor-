# ──────────────────────────────────────────────────────────────────
# Net Monitor App — Dockerfile
# INY1105 Infraestructura de Aplicaciones I — Duoc UC
# Alumno: Felipe Villarroel Rivera
# ──────────────────────────────────────────────────────────────────

FROM python:3.11-slim

# Metadatos de la imagen personalizados con tu autoría
LABEL maintainer="fe.villaroelr@duocuc.cl"
LABEL description="Net Monitor App — Monitoreo de infraestructura de red por TU NOMBRE"
LABEL version="1.0"

# Variables de entorno (Provistas por el docente)
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=5000

# 1. Directorio de trabajo dentro del contenedor
WORKDIR /app

# 2. Instalar dependencias del sistema necesarias para psutil (Provisto por el docente)
RUN apt-get update && apt-get install -y --no-install-recommends \
        iputils-ping \
        net-tools \
        netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# 3. Copiar e instalar dependencias Python primero (Optimización de Caché)
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copiar el código fuente de la aplicación
COPY app/ .

# 5. Puerto solicitado (Provisto por el docente)
EXPOSE 5000

# 6. Comando de ejecución (Provisto por el docente)
CMD ["python", "app.py"]