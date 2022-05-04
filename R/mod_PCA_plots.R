#' PCA_plots UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_PCA_plots_ui <- function(id){
  ns <- NS(id)
  tagList(
    titlePanel("PCA Plots"),

    shiny::sidebarLayout(
      shiny::sidebarPanel(
        boldtext("Choose x-value:"),
        shiny::radioButtons(
          inputId = ns("PCA_choice_x"),
          label = NULL,
          choices = c("PC 1" = ".fittedPC1",
                      "PC 2" = ".fittedPC2",
                      "PC 3" = ".fittedPC3",
                      "PC 4" = ".fittedPC4",
                      "PC 5" = ".fittedPC5")
        ),

        boldtext("Choose y-value:"),
        shiny::radioButtons(
          inputId = ns("PCA_choice_y"),
          label = NULL,
          choices = c("PC 1" = ".fittedPC1",
                      "PC 2" = ".fittedPC2",
                      "PC 3" = ".fittedPC3",
                      "PC 4" = ".fittedPC4",
                      "PC 5" = ".fittedPC5"),
          selected = (".fittedPC2")
        ),

        # Set width of sidebar panel
        width = 3
      ),
      shiny::mainPanel(
        shiny::plotOutput(
          outputId = ns("PCA")
        ),

        # Set width of main panel
        width = 9
      )
    )
  )
}

#' PCA_plots Server Functions
#'
#' @noRd
mod_PCA_plots_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$PCA <- renderPlot(
      pca_vis_BRCA(my_data_clean_aug,
                   input$PCA_choice_x,
                   input$PCA_choice_y)
      )

  })
}

## To be copied in the UI
# mod_PCA_plots_ui("PCA_plots_1")

## To be copied in the server
# mod_PCA_plots_server("PCA_plots_1")
