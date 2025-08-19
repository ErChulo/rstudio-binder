# Dockerfile: imagen base RStudio con control total para Binder / repo2docker
FROM rocker/rstudio:4.3.2

LABEL maintainer="tu-email@example.com"

ENV DEBIAN_FRONTEND=noninteractive

# Dependencias del sistema (añade aquí las que necesites)
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

# Crear usuario 'binder' (opcional pero útil para permisos)
RUN useradd -m -s /bin/bash binder \
    && echo "binder:binder" | chpasswd \
    && adduser binder sudo

WORKDIR /home/binder

# Copiar y ejecutar el script de instalación de paquetes R
COPY install.R /tmp/install.R
RUN Rscript /tmp/install.R && rm /tmp/install.R

# Asegurar permisos (si el contenido del repo se copia después por Binder será gestionado)
RUN chown -R binder:binder /home/binder

EXPOSE 8787

CMD ["/init"]
