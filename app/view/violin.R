box::use(
  shiny[h3, NS, moduleServer, req],
  bslib[card, card_header],
  plotly,
  magrittr[`%>%`]
)


#' @export
ui <- function(id){
  ns <- NS(id)


  card(full_screen=TRUE,
       card_header("Violin"),
       plotly$plotlyOutput(ns("violin1")),
       plotly$plotlyOutput(ns("violin2"))
       )
}

#' @export
server <- function(id, r) {
  moduleServer(id, function(input, output, session) {

    output$violin1 <- plotly$renderPlotly({
      req(r$var1)
        fig <- r$data_high %>%
          plotly$plot_ly(
            y = ~get(r$var1),
            type = 'violin',
            box = list(
              visible = T
            ),
            meanline = list(
              visible = T
            ),
            x0 = paste0(r$var1)
          )

        fig <- fig %>%
          plotly$layout(
            yaxis = list(
              title = "",
              zeroline = F
            )
          )

        fig
    })

    output$violin2 <- plotly$renderPlotly({
      req(r$var2)
        fig <- r$data_high %>%
          plotly$plot_ly(
            y = ~get(r$var2),
            type = 'violin',
            box = list(
              visible = T
            ),
            meanline = list(
              visible = T
            ),
            x0 = paste0(r$var2)
          )

        fig <- fig %>%
          plotly$layout(
            yaxis = list(
              title = "",
              zeroline = F
            )
          )

        fig
    })

  })
}

