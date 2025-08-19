# Dockerfile corregido: NO crear usuarios ni cambiar ownership
FROM rocker/rstudio:4.3.2

LABEL maintainer="tu-email@example.com"
ENV DEBIAN_FRONTEND=noninteractive

# Dependencias del sistema necesarias para compilar paquetes R
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libxml2-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libgit2-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libpng-dev \
    libjpeg-dev \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/rstudio

# Copiar y ejecutar script de instalación de paquetes R
# (install.R debe estar en la raíz del repo)
COPY install.R /tmp/install.R
RUN Rscript /tmp/install.R && rm /tmp/install.R

EXPOSE 8787

# Usar el init de la imagen base (arranca rserver correctamente)
CMD ["/init"]

