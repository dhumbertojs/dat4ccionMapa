#' mapa_sidebar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_mapa_sidebar_ui <- function(id) {
  ns <- NS(id)
  tagList(
    tags$div(
      style = "
        display: flex;
        height: 620px;
        overflow: hidden;
        margin: 0 80px 24px 80px;
      ",

      # SIDEBAR izquierda
      tags$div(
        style = "
          min-width: 320px;
          height: 100%;
          overflow-y: auto;
          background-color: #FFFFF1;
          border: 1px solid rgba(158, 70, 173, 0.2);
          border-radius: 8px;
          margin-right: 16px;
        ",

        # Estado vacío
        conditionalPanel(
          condition = sprintf("output['%s'] == ''", ns("estado_seleccionado")),
          tags$div(
            style = "
              display: flex;
              flex-direction: column;
              align-items: center;
              justify-content: center;
              height: 100%;
              padding: 24px;
              text-align: center;
            ",
            tags$p("📍", style = "font-size: 32px; margin-bottom: 12px;"),
            tags$p("Selecciona un estado en el mapa para ver su perfil",
                   style = "font-size: 14px; color: #1a1a2e;")
          )
        ),

        # Estado con perfil
        conditionalPanel(
          condition = sprintf("output['%s'] != ''", ns("estado_seleccionado")),
          tags$div(
            style = "padding: 20px;",

            # Encabezado
            tags$div(
              style = "display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 16px;",
              tags$div(
                tags$h2(textOutput(ns("nombre_estado")),
                        style = "font-size: 24px; font-weight: 700; color: #4D1A72; margin: 0 0 4px 0;"),
                tags$div(
                  style = "display: flex; align-items: baseline; gap: 8px;",
                  textOutput(ns("valor_indice")),
                  tags$span(textOutput(ns("nivel_indice")))
                )
              ),
              actionButton(ns("cerrar_sidebar"), "×",
                           style = "background: none; border: none; font-size: 20px; color: #1a1a2e; cursor: pointer; padding: 0;")
            ),

            # Bloque 1 — Violencia registrada
            tags$div(
              style = "border-top: 1px solid rgba(158,70,173,0.2); padding-top: 16px; margin-top: 16px;",
              tags$h3("Violencia registrada",
                      style = "font-size: 14px; font-weight: 700; color: #4D1A72; margin: 0 0 12px 0;"),
              tags$div(
                style = "display: flex; justify-content: space-between;",
                tags$span("Tasa de feminicidios", style = "font-size: 13px; color: #1a1a2e;"),
                textOutput((ns("tasa_feminicidios")))
              ),
              tags$div(
                style = "display: flex; justify-content: space-between; margin-top: 8px;",
                tags$span("Alerta de Violencia de Género", style = "font-size: 13px; color: #1a1a2e;"),
                textOutput(ns("avgm_estado"))
              )
            ),

            # Bloque 2 — Tipos de violencia
            tags$div(
              style = "border-top: 1px solid rgba(158,70,173,0.2); padding-top: 16px; margin-top: 16px;",
              tags$h3(
                tags$span("Tipos de violencia", style = "font-weight: 700;"),
                tags$span(" ENDIREH 2021", style = "font-size: 11px; font-weight: 400;"),
                style = "font-size: 14px; color: #4D1A72; margin: 0 0 12px 0;"
              ),
              # Psicológica
              tags$div(style = "margin-bottom: 10px;",
                       tags$div(style = "display: flex; justify-content: space-between;",
                                tags$span("Psicológica", style = "font-size: 13px; color: #1a1a2e;"),
                                textOutput(ns("viol_psicologica"))),
                       tags$div(style = "background: #F5F0FF; border-radius: 4px; height: 8px; margin-top: 4px; border: 1px solid rgba(158, 70, 173, 0.1);",
                                tags$div(uiOutput(ns("barra_psicologica"))))
              ),
              # Física
              tags$div(style = "margin-bottom: 10px;",
                       tags$div(style = "display: flex; justify-content: space-between;",
                                tags$span("Física", style = "font-size: 13px; color: #1a1a2e;"),
                                textOutput(ns("viol_fisica"))),
                       tags$div(style = "background: #F5F0FF; border-radius: 4px; height: 8px; margin-top: 4px; border: 1px solid rgba(158, 70, 173, 0.1);",
                                tags$div(uiOutput(ns("barra_fisica"))))
              ),
              # Sexual
              tags$div(style = "margin-bottom: 10px;",
                       tags$div(style = "display: flex; justify-content: space-between;",
                                tags$span("Sexual", style = "font-size: 13px; color: #1a1a2e;"),
                                textOutput(ns("viol_sexual"))),
                       tags$div(style = "background: #F5F0FF; border-radius: 4px; height: 8px; margin-top: 4px; border: 1px solid rgba(158, 70, 173, 0.1);",
                                tags$div(uiOutput(ns("barra_sexual"))))
              ),
              # Económica
              tags$div(style = "margin-bottom: 10px;",
                       tags$div(style = "display: flex; justify-content: space-between;",
                                tags$span("Económica", style = "font-size: 13px; color: #1a1a2e;"),
                                textOutput(ns("viol_economica"))),
                       tags$div(style = "background: #F5F0FF; border-radius: 4px; height: 8px; margin-top: 4px; border: 1px solid rgba(158, 70, 173, 0.1);",
                                tags$div(uiOutput(ns("barra_economica"))))
              )
            ),
            # Bloque 3 — Percepción
            tags$div(
              style = "border-top: 1px solid rgba(158,70,173,0.2); padding-top: 16px; margin-top: 16px;",
              tags$h3("Percepción",
                      style = "font-size: 14px; font-weight: 700; color: #4D1A72; margin: 0 0 12px 0;"),
              tags$div(
                style = "display: flex; justify-content: space-between;",
                tags$span("Mujeres que perciben inseguro su municipio",
                          style = "font-size: 13px; color: #1a1a2e; max-width: 60%;"),
                tags$span(textOutput(ns("percepcion_estado")),
                          style = "font-size: 18px; font-weight: 700; color: #4D1A72;")
              )
            ),

            # Bloque 4 — Presupuesto
            tags$div(
              style = "border-top: 1px solid rgba(158,70,173,0.2); padding-top: 16px; margin-top: 16px;",
              tags$h3("Presupuesto",
                      style = "font-size: 14px; font-weight: 700; color: #4D1A72; margin: 0 0 12px 0;"),
              tags$p("Presupuesto para combatir violencia de género",
                     style = "font-size: 13px; color: #1a1a2e; margin: 0 0 8px 0;"),
              uiOutput(ns("presupuesto_estado"))
            ),

            # Bloque 5 — Cobertura mediática
            tags$div(
              style = "border-top: 1px solid rgba(158,70,173,0.2); padding-top: 16px; margin-top: 16px;",
              tags$h3("Cobertura mediática",
                      style = "font-size: 14px; font-weight: 700; color: #4D1A72; margin: 0 0 12px 0;"),
              tags$p("Palabras más frecuentes en notas periodísticas",
                     style = "font-size: 13px; color: #1a1a2e; margin: 0 0 8px 0;"),
              uiOutput(ns("cobertura_estado"))
            )
          )
        )
      ),

      # MAPA derecha
      tags$div(
        style = "flex: 1; height: 100%;",
        leafletOutput(ns("mapa_mexico"), height = "100%")
      )
    )
  )
}

#' mapa_sidebar Server Functions
#'
#' @noRd
mod_mapa_sidebar_server <- function(id, data_sf, data_violencia) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    # Estado seleccionado (CVE_ENT)
    rv <- reactiveValues(
      estado_sel = ""
    )

    # Exportar estado_seleccionado para conditionalPanel
    output$estado_seleccionado <- reactive({
      rv$estado_sel
    })
    outputOptions(output, "estado_seleccionado", suspendWhenHidden = FALSE)

    # Cerrar sidebar
    observeEvent(input$cerrar_sidebar, {
      rv$estado_sel <- ""
    })

    # Datos combinados para el mapa
    # map_data <- reactive({
    #   req(data_sf(), data_violencia())
    #   data_sf() |>
    #     dplyr::left_join(data_violencia(), by = "CVE_ENT")
    # })

    map_data <- reactive({
      req(data_sf(), data_violencia())

      sf::st_as_sf(
        dplyr::left_join(
          data_sf(),
          data_violencia(),
          by = "CVE_ENT"
        )
      )
    })

    # Paleta de colores personalizada
    pal <- reactive({
      req(map_data())
      bins <- c(0, 0.25, 0.5, 0.75, 1)
      colors <- c("#FFFFD4", "#78C679", "#9E46AD", "#4D1A72")

      colorBin(
        palette = colors,
        domain = c(0, 1),
        bins = bins,
        na.color = "transparent"
      )
    })

    # Renderizar mapa
    output$mapa_mexico <- renderLeaflet({
      req(map_data())

      leaflet(map_data()) |>
        addProviderTiles(providers$CartoDB.PositronNoLabels) |>
        setView(lng = -102, lat = 24, zoom = 4.5) %>%
        addPolygons(
          fillColor = ~pal()(indice_violencia),
          weight = 1,
          opacity = 1,
          color = "white",
          fillOpacity = 0.8,
          highlightOptions = highlightOptions(
            weight = 2,
            color = "#4D1A72",
            fillOpacity = 0.9,
            bringToFront = TRUE
          ),
          label = ~NOMGEO,
          layerId = ~CVE_ENT
        ) %>%
        addLegend(
          position = "bottomright",
          pal = pal(),
          values = ~indice_violencia,
          title = "Índice de violencia",
          opacity = 0.9
        )
    })

    # Capturar clic en el mapa
    observeEvent(input$mapa_mexico_shape_click, {
      rv$estado_sel <- input$mapa_mexico_shape_click$id
    })

    # Datos del estado seleccionado
    estado_data <- reactive({
      req(rv$estado_sel != "", data_violencia())
      data_violencia() |>
        dplyr::filter(CVE_ENT == rv$estado_sel)
    })

    # Outputs del Sidebar
    output$nombre_estado <- renderText({
      req(estado_data(), data_sf())
      data_sf()$NOMGEO[data_sf()$CVE_ENT == rv$estado_sel]
    })

    output$valor_indice <- renderText({
      req(estado_data())
      round(estado_data()$indice_violencia, 2)
    })

    output$nivel_indice <- renderText({
      req(estado_data())
      val <- estado_data()$indice_violencia
      if (val > 0.6) "Alto"
      else if (val > 0.4) "Medio"
      else "Bajo"
    })

    output$tasa_feminicidios <- renderText({
      req(estado_data())
      round(estado_data()$tasa_feminicidios, 1)
    })

    output$avgm_estado <- renderText({
      req(estado_data())
      estado_data()$avgm
    })

    output$viol_psicologica <- renderText({
      req(estado_data())
      paste0(round(estado_data()$violencia_psicologica, 1), "%")
    })
    output$barra_psicologica <- renderUI({
      req(estado_data())
      tags$div(style = sprintf("background: #9E46AD; height: 100%%; width: %s%%; border-radius: 4px;",
                               estado_data()$violencia_psicologica))
    })

    output$viol_fisica <- renderText({
      req(estado_data())
      paste0(round(estado_data()$violencia_fisica, 1), "%")
    })
    output$barra_fisica <- renderUI({
      req(estado_data())
      tags$div(style = sprintf("background: #9E46AD; height: 100%%; width: %s%%; border-radius: 4px;",
                               estado_data()$violencia_fisica))
    })

    output$viol_sexual <- renderText({
      req(estado_data())
      paste0(round(estado_data()$violencia_sexual, 1), "%")
    })
    output$barra_sexual <- renderUI({
      req(estado_data())
      tags$div(style = sprintf("background: #9E46AD; height: 100%%; width: %s%%; border-radius: 4px;",
                               estado_data()$violencia_sexual))
    })

    output$viol_economica <- renderText({
      req(estado_data())
      paste0(round(estado_data()$violencia_economica, 1), "%")
    })
    output$barra_economica <- renderUI({
      req(estado_data())
      tags$div(style = sprintf("background: #9E46AD; height: 100%%; width: %s%%; border-radius: 4px;",
                               estado_data()$violencia_economica))
    })

    output$percepcion_estado <- renderText({
      req(estado_data())
      # Format perception if it's a large number or percentage
      # Based on str(), it looks like a number like 45301, maybe rate?
      # User example showed 43.7%. I'll just show the value.
      format(estado_data()$percepcion_inseguridad, big.mark = ",")
    })

    output$presupuesto_estado <- renderUI({
      req(estado_data())
      val <- estado_data()$presupuesto_avgm
      if (is.na(val) || val == "Sin especificar") {
        tags$span("No disponible", style = "color: #717182; font-style: italic;")
      } else {
        tags$span(sprintf("$%s", format(as.numeric(val), big.mark = ",")),
                  style = "font-size: 18px; font-weight: 700; color: #4D1A72;")
      }
    })

    output$cobertura_estado <- renderUI({
      req(estado_data())
      palabras <- estado_data()$top_palabras_notas
      if (is.na(palabras) || palabras == "") {
        tags$span("Información no disponible", style = "color: #717182; font-style: italic;")
      } else {
        tags$div(
          style = "display: flex; flex-wrap: wrap; gap: 4px;",
          lapply(strsplit(palabras, ", ")[[1]], function(p) {
            tags$span(p, style = "background: #EAE8F0; padding: 2px 8px; border-radius: 12px; font-size: 12px; color: #4D1A72;")
          })
        )
      }
    })

  })
}
