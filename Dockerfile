FROM python:3.11-slim

LABEL maintainer="Felipe Villarroel"
LABEL description="Net Monitor App - monitoreo de infraestructura de red"
LABEL version="1.0"

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=5000

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
        iputils-ping \
        net-tools \
        netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

COPY app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app/ .

RUN mkdir -p /app/logs

EXPOSE 5000

CMD ["python", "app.py"]
