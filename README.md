# survey-dashboard
Flujo automatizado para descargar una encuesta diaria, filtrar casos completos y publicar
un dashboard Shiny estático (shinylive/webR) en GitHub Pages.

**URL de la app:** https://<usuario>.github.io/survey-dashboard/

### Uso local
1. `renv::restore()`  
2. Modifica `URL_CSV` en variables de entorno o `.Renviron`.  
3. `Rscript R/download_process.R`  
4. `shinylive::run("R/app.R")`
