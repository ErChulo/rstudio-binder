# rstudio-binder
Para usar RStudio via mybinder.org

## Archivos en este repositorio
- `Dockerfile` — imagen base RStudio con control total del sistema y ejecución de `install.R`.
- `runtime.txt` — versión de R fijada (opcional cuando hay Dockerfile).
- `install.R` — script que instala paquetes R (modifica `required_packages` o añade `renv.lock`).
- Tu código y datos — ponlos en la raíz o en carpetas (`analysis.R`, `data/`, etc.).

## Cómo pushear y lanzar en mybinder.org
1. Sube todo este repositorio a GitHub.
2. Abre Binder con la URL (reemplaza `<USUARIO>`, `<REPO>`, `<RAMA>`):


## Notas rápidas
- Repo2Docker detecta `Dockerfile` y lo usará para construir la imagen. Si prefieres usar solo `runtime.txt` + `install.R`, quita el `Dockerfile`.
- Para fijar versiones de paquetes usa `renv` (`renv::snapshot()` -> añade `renv.lock` al repo), `install.R` restaurará `renv.lock` automáticamente.
- Si necesitas más dependencias del sistema, añádelas en la sección `apt-get install` del `Dockerfile`.

## Botón de Binder (pegalo en este README después de subir)
```markdown
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ErChulo/rstudio-binder/main?urlpath=rstudio)
