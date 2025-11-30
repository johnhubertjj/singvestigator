box::use(
  shiny[h3, varSelectInput, ns],
  bslib[sidebar],
)
ui <- function(id){
  ns <- NS(id)

#' @export
sidebar(
  h3("Inputs"),
  # selectizeInput("high_or_low", choices=c("high", 'low'))

  varSelectInput(ns("var1"), "Select variable 1:", data=NULL),
  varSelectInput(ns("var2"), "Select variable 2: ", data = NULL),
  varSelectInput(ns("varall"), "Select variables for PCA:", data = NULL, multiple = TRUE)

)
}

server <- function(id, r) {
  moduleServer(id, function(input, output, session) {

    observeEvent(input$var1,{
      r$var1 <- input$var1
    })

    observeEvent(input$var2,{
      r$var2 <- input$var2
    })

    observeEvent(input$varall,{
      r$varall <- input$varall
    })

    observe({
      updateVarSelectInput(session = session,
                           inputId = 'var1',data = r$data_high)
      updateVarSelectInput(session = session,
                           inputId = 'var2',data = r$data_high)
      updateVarSelectInput(session = session,
                           inputId = 'varall',data = r$data_high)
    })

  })
}

