#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny leaflet htmltools dplyr bslib
#' @noRd
app_server <- function(input, output, session) {
  # ── Datos ──────────────────────────────────────────────────────────────────

  estados_sf <- reactive({
    sf_path <- app_sys("app/extdata/mapa_simple.RDS")

    if (file.exists(sf_path)) {
      readRDS(sf_path)
    } else {
      # Fallback: devuelve NULL si aún no existe el archivo
      NULL
    }
  })

  # ── Dataframe de violencia ─────────────────────────────────────────────────

  datos_violencia <- reactive({
    df_path <- app_sys("app/extdata/indice_df.RDS")

    if(file.exists(df_path)) {
      readRDS(df_path)
    } else {
      NULL
    }
  })

  # ── Módulo Mapa + Sidebar ─────────────────────────────────────────────────

  mod_mapa_sidebar_server("mapa_sidebar_1", estados_sf, datos_violencia)

  # ── Descarga de datos ──────────────────────────────────────────────────────

  output$descargar_datos <- downloadHandler(
    filename = function() {
      paste0("indice_violencia_mexico_", Sys.Date(), ".csv")
    },
    content = function(file) {
      write.csv(datos_violencia(), file, row.names = FALSE)
    }
  )

}
