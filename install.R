# install.R
# Ejecutado durante la construcción (Dockerfile / repo2docker)
options(repos = c(CRAN = "https://cloud.r-project.org"))

# Paquetes por defecto (modifica esta lista según necesites)
required_packages <- c(
  "ggplot2",
  "dplyr",
  "tidyr",
  "readr"
)

# Instalar 'remotes' y 'renv' si es necesario
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

# Si hay un lockfile de renv, restaurar; si no, instalar paquetes listados
if (file.exists("renv.lock")) {
  if (!requireNamespace("renv", quietly = TRUE)) {
    install.packages("renv")
  }
  # restaurar según renv.lock
  renv::restore(prompt = FALSE)
} else {
  # instalar versiones actuales desde CRAN
  install.packages(setdiff(required_packages, rownames(installed.packages())))
}

# Ejemplo: instalar paquete desde GitHub (descomentar y ajustar si lo necesitas)
# remotes::install_github("usuario/paquete")

# Verificación simple
cat("Paquetes instalados:\n")
print(installed.packages()[, c("Package", "Version")])
