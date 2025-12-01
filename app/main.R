# app/main
box::use(
  shiny[bootstrapPage, div, h1, h3, moduleServer, icon, NS, renderUI,
        tags, reactiveValues, sliderInput, plotOutput, renderPlot, varSelectInput,
        observe,updateVarSelectInput],
  rhino[rhinos],
  datasets[mtcars],
  ggplot2[ggplot, geom_histogram, aes],
  bslib[page_sidebar, sidebar, card, card_header],
  utils[read.csv],
  echarts4r,
  plotly,
  magrittr[`%>%`]
)

box::use(
  app/view/chart,
  app/view/table,
  app/view/theme,
  app/view/sidebar,
  app/view/linear_regression,
  app/view/violin,
)


#' @export
ui <- function(id) {
  ns <- NS(id)
  page_sidebar(
    title="Singvestigation",
    sidebar=sidebar$ui(ns("sidebar")),
    linear_regression$ui(ns("linear_regression")),
    violin$ui(ns("violin"))
  )

  # bootstrapPage(
  #   div(
  #     class= "components-container",
  #     table$ui(ns("table")),
  #     chart$ui(ns("chart"))
  #   ),
  #   tags$button(
  #     id = "help-button",
  #     icon("question"),
  #     onclick = "App.showHelp()"
  #   )
  # )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # output$message <- renderUI({
    #   div(
    #     style = "display: flex; justify-content: center; align-items: center; height: 100vh;",
    #     tags$h1(
    #       tags$a("Check out Rhino docs!", href = "https://appsilon.github.io/rhino/")
    #     )
    #   )
    # })
    r <- reactiveValues()
    r$data_high <- read.csv("app/static/data/high_popularity_spotify_data.csv")
    r$data_low <- read.csv("app/static/data/low_popularity_spotify_data.csv")

    sidebar$server('sidebar', r=r)
    linear_regression$server('linear_regression', r=r)
    violin$server('violin', r=r)



    #
    # output$chart <- echarts4r$renderEcharts4r({
    #   r$data_high |>
    #
    #     echarts4r$e_charts(.data_high[[input$var1]]) |>
    #     echarts4r$e_scatter(.data[[input$var2]]) |>
    #     # Add the linear regression line
    #     echarts4r$e_lm() |>
    #     echarts4r$e_title(paste0("Linear Regression of", .data[[input$var1]]," vs. ", .data[[input$var2]]))
    # })

  })
}
