#' densityplots UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_densityplots_ui <- function(id){
  ns <- NS(id)
  tagList(
    titlePanel("Density plots of proteins"),
    shiny::sidebarPanel(
      boldtext("Choose proteins"),
      shiny::checkboxGroupInput(
        inputId = ns("Protein_choice_dens"),
        label = NULL,
        choices = c("Protein1","Protein2","Protein3","Protein4")
      ),
      boldtext("Choose attribute"),
      shiny::radioButtons(
        inputId = ns("Attribute_dens"),
        label = NULL,
        choices = c("Tumour_Stage","Histology","HER2.status","Patient_Status")
      )
    ),
    mainPanel(
      shiny::plotOutput(
        outputId = ns("Density_Plot")
      )
    )
  )
}

#' densityplots Server Functions
#'
#' @noRd
mod_densityplots_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$Density_Plot <- renderPlot(
      dens_protein_BRCA(data = my_data_clean_aug,
                        proteins = input$Protein_choice_dens,
                        attribute = input$Attribute_dens)
    )
  })
}

## To be copied in the UI
# mod_densityplots_ui("densityplots_1")

## To be copied in the server
# mod_densityplots_server("densityplots_1")
