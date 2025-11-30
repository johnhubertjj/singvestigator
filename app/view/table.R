# app/view/table.R

box::use(
  reactable,
  shiny[div, moduleServer, NS],
)

box::use(
  app/logic/data_transformation[transform_data],
)

#' @export
ui <- function(id) {
  ns <- NS(id)


    div(
      class = "component-box",
      reactable$reactableOutput(ns("table"))
    )

}

#' @export
server <- function(id,data) {
  moduleServer(id, function(input, output, session) {
    output$table <- reactable$renderReactable(
      reactable$reactable(data)
    )
  })
}
