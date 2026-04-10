#' kpi_card
#'
#' @description A fct function
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd
kpi_card <- function(id, title) {
  ns <- NS(id)

  card(
    class = "kpi-card",
    card_body(
      div(
        class = "kpi_value",
        textOutput(ns("value"))
      ),
      p(
        title,
        class = "kpi-subtitle"
      )
    )
  )
}
