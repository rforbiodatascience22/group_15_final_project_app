#' variable_overview UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_variable_overview_ui <- function(id){
  ns <- NS(id)
  tagList(
    titlePanel("test"),

    shiny::sidebarLayout(
      shiny::sidebarPanel(
        shiny::radioButtons(
          inputId = ns("attributes"),
          label = NULL,
          choices = c("Protein1", "Protein2")
        )
      ),
      shiny::mainPanel(
        shiny::plotOutput(
          outputId = ns("abundance")
        ),
        shiny::textOutput(outputId = ns("attributes"))
      )
    )
  )
}

#' variable_overview Server Functions
#'
#' @noRd
mod_variable_overview_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$abundance <- renderPlot(
      boxplot_brca(my_data_clean,
                   "Tumour_Stage",
                   input$attributes)
    )

    # peptide header
    output$attributes <- renderText({
      input$attributes
    })

  })
}

## To be copied in the UI
# mod_variable_overview_ui("variable_overview_1")

## To be copied in the server
# mod_variable_overview_server("variable_overview_1")
