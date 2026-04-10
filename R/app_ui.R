#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),

    tags$div(
      style = "background-color: #FFFFF1; min-height: 100vh;",

      # ============ HEADER ============
      tags$header(
        style = "
          background-color: #EAE8F0;
          border-bottom: 3px solid #4D1A72;
          padding: 24px 80px;
          display: flex;
          justify-content: space-between;
          align-items: flex-start;
        ",
        tags$div(
          tags$h1(
            "Radiografía de violencias",
            style = "
              font-size: 36px;
              font-weight: 700;
              color: #4D1A72;
              margin: 0 0 4px 0;
            "
          ),
          tags$p(
            "Índice de violencia de género por entidad federativa · México 2021",
            style = "
              font-size: 15px;
              color: #1a1a2e;
              margin: 0;
            "
          )
        ),
        tags$nav(
          style = "display: flex; gap: 32px; padding-top: 8px;",
          tags$a("Inicio", href = "#inicio",
                 style = "color: #4D1A72; font-size: 14px; font-weight: 500; text-decoration: none;"),
          tags$a("Metodología", href = "#metodologia",
                 style = "color: #4D1A72; font-size: 14px; font-weight: 500; text-decoration: none;"),
          tags$a("Descargar datos", href = "#descargar",
                 style = "color: #4D1A72; font-size: 14px; font-weight: 500; text-decoration: none;")
        )
      ),

      # ============ INTRODUCCIÓN ============
      tags$div(
        id = "inicio",
        style = "padding: 24px 80px; max-width: 860px; margin: 0 auto;",
        tags$p(
          "El 70.1% de las mujeres de 15 años o más en México ha experimentado
          al menos un incidente de violencia a lo largo de su vida (ENDIREH 2021)
          y en 2024 se registraron más de 800 presuntos feminicidios según el SESNSP.
          Ante la dispersión e incompletitud de los datos existentes, Radiografía de
          violencias busca sistematizar información integral y territorialmente
          desagregada sobre los tipos de violencia de género en las 32 entidades
          federativas, integrando encuestas de percepción, carpetas de investigación
          de delitos contra las mujeres, notas informativas de medios locales y el
          presupuesto asignado en cada entidad para prevenir o combatir la
          violencia de género.",
          style = "font-size: 16px; color: #1a1a2e; line-height: 1.6; margin: 0;"
        )
      ),

      # ============ KPIs ============
      tags$div(
        style = "
          display: grid;
          grid-template-columns: repeat(4, 1fr);
          gap: 16px;
          padding: 24px 80px;
        ",

        # KPI 1 — Feminicidios
        tags$div(
          style = "background-color: #F5F0FF; border: 1px solid rgba(158, 70, 173, 0.2); border-radius: 8px; padding: 24px;",
          tags$div("1.1",
                   style = "font-size: 42px; font-weight: 700; color: #4D1A72; margin-bottom: 8px;"),
          tags$p("Tasa de feminicidios por 100 mil mujeres",
                 style = "font-size: 14px; color: #1a1a2e; margin: 0;")
        ),


        # KPI 2 — Índice
        tags$div(
          style = "background-color: #F5F0FF; border: 1px solid rgba(158, 70, 173, 0.2); border-radius: 8px; padding: 24px;",
          tags$div("0.46",
                   style = "font-size: 42px; font-weight: 700; color: #4D1A72; margin-bottom: 8px;"),
          tags$p("Promedio nacional del índice de violencia",
                 style = "font-size: 14px; color: #1a1a2e; margin: 0;")
        ),

        # KPI 3 — AVGM
        tags$div(
          style = "background-color: #F5F0FF; border: 1px solid rgba(158, 70, 173, 0.2); border-radius: 8px; padding: 24px;",
          tags$div("22",
                   style = "font-size: 42px; font-weight: 700; color: #4D1A72; margin-bottom: 8px;"),
          tags$p("Entidades con Alerta de Violencia de Género activa",
                 style = "font-size: 14px; color: #1a1a2e; margin: 0;")
        ),

        # KPI 4 — Percepción
        tags$div(
          style = "background-color: #F5F0FF; border: 1px solid rgba(158, 70, 173, 0.2); border-radius: 8px; padding: 24px;",
          tags$div("43.7%",
                   style = "font-size: 42px; font-weight: 700; color: #4D1A72; margin-bottom: 8px;"),
          tags$p("Mujeres que perciben inseguro su municipio",
                 style = "font-size: 14px; color: #1a1a2e; margin: 0;")
        )
      ),

      # ============ MAPA + SIDEBAR ============
      mod_mapa_sidebar_ui("mapa_sidebar_1"),

      # ============ METODOLOGÍA ============
      tags$div(
        id = "metodologia",
        style = "padding: 24px 80px;",
        tags$h2("Metodología",
                style = "font-size: 28px; font-weight: 700; color: #4D1A72; margin-bottom: 16px;"),
        tags$p(
          "El índice de violencia de género es un indicador ponderado que integra
          ocho variables clave para medir la situación de violencia hacia las mujeres
          en cada entidad federativa de México. Los datos corresponden al año 2021.",
          style = "font-size: 16px; color: #1a1a2e; line-height: 1.6; margin-bottom: 24px;"
        ),
        tags$table(
          style = "width: 100%; border-collapse: collapse;",
          tags$thead(
            tags$tr(
              tags$th("Variable", style = "background: #4D1A72; color: #FFFFF1; padding: 12px 16px; text-align: left;"),
              tags$th("Peso en el índice", style = "background: #4D1A72; color: #FFFFF1; padding: 12px 16px; text-align: left;"),
              tags$th("Fuente", style = "background: #4D1A72; color: #FFFFF1; padding: 12px 16px; text-align: left;")
            )
          ),
          tags$tbody(
            tags$tr(style = "background: #FFFFF1;",
                    tags$td("Tasa de feminicidios", style = "padding: 12px 16px; font-size: 14px;"),
                    tags$td("30%", style = "padding: 12px 16px; font-size: 14px; font-weight: 700;"),
                    tags$td("SESNSP", style = "padding: 12px 16px; font-size: 14px; color: #717182;")
            ),
            tags$tr(style = "background: #F5F0FF;",
                    tags$td("Violencia psicológica", style = "padding: 12px 16px; font-size: 14px;"),
                    tags$td("15%", style = "padding: 12px 16px; font-size: 14px; font-weight: 700;"),
                    tags$td("ENDIREH 2021", style = "padding: 12px 16px; font-size: 14px; color: #717182;")
            ),
            tags$tr(style = "background: #FFFFF1;",
                    tags$td("Violencia física", style = "padding: 12px 16px; font-size: 14px;"),
                    tags$td("15%", style = "padding: 12px 16px; font-size: 14px; font-weight: 700;"),
                    tags$td("ENDIREH 2021", style = "padding: 12px 16px; font-size: 14px; color: #717182;")
            ),
            tags$tr(style = "background: #F5F0FF;",
                    tags$td("Violencia sexual", style = "padding: 12px 16px; font-size: 14px;"),
                    tags$td("15%", style = "padding: 12px 16px; font-size: 14px; font-weight: 700;"),
                    tags$td("ENDIREH 2021", style = "padding: 12px 16px; font-size: 14px; color: #717182;")
            ),
            tags$tr(style = "background: #FFFFF1;",
                    tags$td("Violencia económica", style = "padding: 12px 16px; font-size: 14px;"),
                    tags$td("15%", style = "padding: 12px 16px; font-size: 14px; font-weight: 700;"),
                    tags$td("ENDIREH 2021", style = "padding: 12px 16px; font-size: 14px; color: #717182;")
            ),
            tags$tr(style = "background: #F5F0FF;",
                    tags$td("Percepción de inseguridad", style = "padding: 12px 16px; font-size: 14px;"),
                    tags$td("10%", style = "padding: 12px 16px; font-size: 14px; font-weight: 700;"),
                    tags$td("ENVIPE", style = "padding: 12px 16px; font-size: 14px; color: #717182;")
            ),
            # tags$tr(style = "background: #FFFFF1;",
            #         tags$td("Presupuesto AVGM", style = "padding: 12px 16px; font-size: 14px;"),
            #         tags$td("20-25%", style = "padding: 12px 16px; font-size: 14px; font-weight: 700;"),
            #         tags$td("Transparencia presupuestaria", style = "padding: 12px 16px; font-size: 14px; color: #717182;")
            # ),
            # tags$tr(style = "background: #F5F0FF;",
            #         tags$td("Cobertura mediática", style = "padding: 12px 16px; font-size: 14px;"),
            #         tags$td("10%", style = "padding: 12px 16px; font-size: 14px; font-weight: 700;"),
            #         tags$td("Scraping web", style = "padding: 12px 16px; font-size: 14px; color: #717182;")
            # )
          )
        ),

        # Notas en 3 columnas
        tags$h3("Notas",
                style = "font-size: 18px; font-weight: 500; color: #4D1A72; margin: 24px 0 12px 0;"),
        tags$div(
          style = "display: grid; grid-template-columns: 1fr 1fr 1fr; background-color: #F5F0FF; border-top: 1px solid rgba(158, 70, 173, 0.2); border-radius: 0 0 12px 12px; width: 100%;",
          tags$div(
            style = "padding: 20px; border-right: 1px solid rgba(158, 70, 173, 0.2);",
            tags$p("Año de referencia",
                   style = "font-size: 14px; font-weight: 700; color: #4D1A72; margin: 0 0 8px 0;"),
            tags$p("La mayoría de los datos corresponden al año 2021, año base de la ENDIREH. La información sobre presupuesto AVGM y cobertura mediática presenta limitaciones en algunas entidades. En estos casos, el índice se calcula con los datos disponibles y se marca explícitamente en el perfil del estado.",
                   style = "font-size: 13px; color: #1a1a2e; line-height: 1.6; margin: 0;")
          ),
          tags$div(
            style = "padding: 20px; border-right: 1px solid rgba(158, 70, 173, 0.2);",
            tags$p("Accesibilidad visual",
                   style = "font-size: 14px; font-weight: 700; color: #4D1A72; margin: 0 0 8px 0;"),
            tags$p("La paleta de color utilizada en el mapa fue seleccionada con criterios de accesibilidad para personas con daltonismo. El gradiente amarillo-morado (YlPu) no depende del canal rojo para comunicar diferencias, siendo perceptible para personas con deuteranopia y protanopia. Fuente: ColorBrewer 2.0, Cynthia Brewer, Penn State. Licencia Apache 2.0.",
                   style = "font-size: 13px; color: #1a1a2e; line-height: 1.6; margin: 0;")
          ),
          tags$div(
            style = "padding: 20px;",
            tags$p("Tecnología",
                   style = "font-size: 14px; font-weight: 700; color: #4D1A72; margin: 0 0 8px 0;"),
            tags$p("El mapa interactivo se desarrolló utilizando R con framework Golem para aplicaciones Shiny. Se utilizó Claude y Figma para el diseño y prototipado de la interfaz. El código puede consultarse en el repositorio de GitHub del proyecto.",
                   style = "font-size: 13px; color: #1a1a2e; line-height: 1.6; margin: 0;")
          )
        )
      ),

      # ============ FOOTER ============
      tags$footer(
        id = "descargar",
        style = "background-color: #4D1A72; color: #FFFFF1; padding: 40px 80px; display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 32px; margin-top: 48px;",
        tags$div(
          tags$p("Recursos", style = "font-size: 14px; font-weight: 700; color: #FFFFF1; margin: 0 0 12px 0;"),
          tags$a("Repositorio GitHub", href = "https://github.com/dhumbertojs/dat4ccionMapa", style = "display: block; color: #FFFFF1; font-size: 13px; margin-bottom: 8px;"),
          downloadLink("descargar_datos", "Descargar datos (CSV)", style = "display: block; color: #FFFFF1; font-size: 13px;")
        ),
        tags$div(
          tags$p("Créditos", style = "font-size: 14px; font-weight: 700; color: #FFFFF1; margin: 0 0 12px 0;"),
          tags$p("Proyecto desarrollado por el equipo de Radiografía de violencia de género. Datos recopilados de fuentes oficiales mexicanas.",
                 style = "font-size: 13px; color: rgba(255,255,241,0.8); margin: 0 0 8px 0;"),
          tags$p("Aída Bustos Martínez · David Humberto Jiménez Sánchez · Sarai Zulema Oviedo Hernández · Cinthya Libertad Ruíz Avendaño",
                 style = "font-size: 12px; color: rgba(255,255,241,0.6); margin: 0;")
        ),
        tags$div(
          tags$p("Fuentes", style = "font-size: 14px; font-weight: 700; color: #FFFFF1; margin: 0 0 12px 0;"),
          tags$p("• ONU Mujeres", style = "font-size: 13px; color: rgba(255,255,241,0.8); margin: 0;"),
          tags$p("• INEGI", style = "font-size: 13px; color: rgba(255,255,241,0.8); margin: 0;"),
          tags$p("• SESNSP", style = "font-size: 13px; color: rgba(255,255,241,0.8); margin: 0;"),
          tags$p("• ENDIREH", style = "font-size: 13px; color: rgba(255,255,241,0.8); margin: 0;"),
          tags$p("• ENVIPE", style = "font-size: 13px; color: rgba(255,255,241,0.8); margin: 0;"),
          tags$p("• Presupuestos de Egresos estatales 2026", style = "font-size: 13px; color: rgba(255,255,241,0.8); margin: 0;")
        )
      )
    )


  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "Radiografía de la violencia"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
