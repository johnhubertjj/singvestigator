box::use(
  shiny[h3, ns],
  bslib[card, card_header],
)


#' @export
ui <- function(id){
  ns <- NS(id)


  card(full_screen=TRUE,
       card_header("Linear Regression"),
       plotly$plotlyOutput(ns("scatter"))
  )
}

#' @export
server <- function(id, r) {
  moduleServer(id, function(input, output, session) {

    output$scatter <- plotly$renderPlotly({
      if(!is.null(r$var1)){
        plotly$plot_ly(r$data_high, x = ~get(r$var1), y = ~get(r$var2), type = 'scatter', mode = 'markers')
      }
    })

  })
}

