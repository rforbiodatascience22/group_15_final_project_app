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
        choices = c("Protein 1" = "Protein1",
                    "Protein 2" = "Protein2",
                    "Protein 3" = "Protein3",
                    "Protein 4" = "Protein4"),
        selected = c("Protein1",'Protein2','Protein3','Protein4')
      ),

      boldtext("Choose grouping"),
      shiny::radioButtons(
        inputId = ns("Attribute_dens"),
        label = NULL,
        choices = c("Tumour stage" = "Tumour_Stage",
                    "Histology",
                    "HER2 status" = "HER2.status",
                    "Patient status" = "Patient_Status")
      ),

      # Set width of sidebar panel
      width = 3
    ),
    mainPanel(
      shiny::plotOutput(
        outputId = ns("Density_Plot")
      ),
    # Set width of main panel
    width = 9
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
