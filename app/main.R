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


#' Main UI function
#' @export
#' @param id identification for client
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

#' Main server function
#' @export
#' @param id idenfication for client
server <- function(id) {
  moduleServer(id, function(input, output, session) {

    r <- reactiveValues()
    r$data_high <- read.csv("app/static/data/high_popularity_spotify_data.csv")
    r$data_low <- read.csv("app/static/data/low_popularity_spotify_data.csv")

    sidebar$server('sidebar', r=r)
    linear_regression$server('linear_regression', r=r)
    violin$server('violin', r=r)





  })
}
