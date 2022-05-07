#' home UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_home_ui <- function(id){
  ns <- NS(id)
  tagList(
    titlePanel("Welcome to the shiny app 'BreastCancerExplorer'"),

    shiny::htmlOutput(
      outputId = ns("home_text")
    )
  )
}

#' home Server Functions
#'
#' @noRd
mod_home_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$home_text <- renderText(
        "<p>This app is made so it is easy for you to explore the
        'Real Breast Cancer Dataset', which can be found
        <a href='https://www.kaggle.com/datasets/amandam1/breastcancerdataset?resource=download&fbclid=IwAR0lsWAUYPk9ZrcTFNt-JOlWm4PtDaueVS-Te-eRkb_WHv3wktfxScBhHKE&select=BRCA.csv'>here</a>.</p>

        <p>The app has three additional panels to this one: <br>
        'Variable overview','Density plot' and 'PCA plots'.<br>
        They all contain a selection panel to the left,
        and a viewing panel on the right.
        Just select your wanted variables from the selection panel
        to visualize these in a plot.</p>

        Currently supports Box-/violin-plots, histograms, densityplots as well
        as a principal component comparison from a PCA analysis.<br>
        The repository for this application is
        <a href='https://github.com/rforbiodatascience22/group_15_final_project_app'>here</a>,
        and the app simply runs by running the 'run_dev.R' script in the '/dev' folder.<br>
        The app downloads its data analysis scripts and functions from another
        repository which is
        <a href='https://github.com/rforbiodatascience22/2022_group15_final_project'>here</a>."
    )
  })
}

## To be copied in the UI
# mod_home_ui("home_1")

## To be copied in the server
# mod_home_server("home_1")
