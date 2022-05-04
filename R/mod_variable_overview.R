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
    fluidRow(
    titlePanel("Factorial vs nummeric attributes"),

    shiny::sidebarLayout(
        shiny::sidebarPanel(
          boldtext("Choose nummeric:"),
          shiny::radioButtons(
            inputId = ns("Nummeric_choice_num_vs_fac"),
            label = NULL,
            choices = c("Protein 1" = "Protein1",
                        "Protein 2" = "Protein2",
                        "Protein 3" = "Protein3",
                        "Protein 4" = "Protein4",
                        "Age",
                        "Diff Time Days" = "Diff_Time_Days")
          ),

          boldtext("Choose factorial:"),
          shiny::radioButtons(
            inputId = ns("Factorial_choice_num_vs_fac"),
            label = NULL,
            choices = c("Tumour stage" = "Tumour_Stage",
                        "Histology",
                        "HER2 status" = "HER2.status",
                        "Surgery type" = "Surgery_type",
                        "Patient status" = "Patient_Status")
          ),

          boldtext("Choose coloring:"),
          shiny::selectInput(
            inputId = ns("color_choise_num_vs_fac"),
            label = NULL,
            choices = c("No coloring" = "NULL",
                        "Tumour stage" = "Tumour_Stage",
                        "Histology",
                        "HER2 status" = "HER2.status",
                        "Surgery type" = "Surgery_type",
                        "Patient status" = "Patient_Status")
          ),

          boldtext("Choose Plot:"),
          shiny::selectInput(
            inputId = ns("plot_type_num_vs_fac"),
            label = NULL,
            choices = c("Boxplot",
                        "Violin plot")
          ),
          # Set width of sidebar panel
          width = 3
        ),
        shiny::mainPanel(
          shiny::plotOutput(
            outputId = ns("num_vs_fac")
          ),

          # Set width of main panel
          width = 9
        )
      )
    ),

    fluidRow(
      titlePanel("Factorial attributes"),

      shiny::sidebarLayout(
        shiny::sidebarPanel(
          boldtext("Choose factorial:"),
          shiny::radioButtons(
            inputId = ns("Factorial_choice_fac"),
            label = NULL,
            choices = c("Tumour stage" = "Tumour_Stage",
                        "Histology",
                        "HER2 status" = "HER2.status",
                        "Surgery type" = "Surgery_type",
                        "Patient status" = "Patient_Status")
          ),

          boldtext("Choose coloring:"),
          shiny::radioButtons(
            inputId = ns("color_choise_fac"),
            label = NULL,
            choices = c("No coloring" = "NULL",
                        "Tumour stage" = "Tumour_Stage",
                        "Histology",
                        "HER2 status" = "HER2.status",
                        "Surgery type" = "Surgery_type",
                        "Patient status" = "Patient_Status")
          ),
          # Set width of sidebar panel
          width = 3
        ),
        shiny::mainPanel(
          shiny::plotOutput(
            outputId = ns("fac")
          ),

          # Set width of main panel
          width = 9
        )
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

    output$num_vs_fac <- renderPlot({
    if (input$plot_type_num_vs_fac == "Boxplot") {
      boxplot_BRCA(my_data_clean_aug,
                   input$Factorial_choice_num_vs_fac,
                   input$Nummeric_choice_num_vs_fac,
                   input$color_choise_num_vs_fac)
        }
    else if (input$plot_type_num_vs_fac == "Violin plot") {
          violin_BRCA(my_data_clean_aug,
                       input$Factorial_choice_num_vs_fac,
                       input$Nummeric_choice_num_vs_fac,
                       input$color_choise_num_vs_fac)
        }
      })


    output$fac <- renderPlot(
      barplot_BRCA(my_data_clean_aug,
                   input$Factorial_choice_fac,
                   input$color_choise_fac)
    )


  })
}

## To be copied in the UI
# mod_variable_overview_ui("variable_overview_1")

## To be copied in the server
# mod_variable_overview_server("variable_overview_1")
