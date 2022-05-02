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
    "This app is made so it is easy for you to explore the 'Real Breast Cancer Dataset', which can be found ",
    tags$a(href="https://www.kaggle.com/datasets/amandam1/breastcancerdataset?resource=download&fbclid=IwAR0lsWAUYPk9ZrcTFNt-JOlWm4PtDaueVS-Te-eRkb_WHv3wktfxScBhHKE&select=BRCA.csv",
           "here"),
  )
}

#' home Server Functions
#'
#' @noRd
mod_home_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_home_ui("home_1")

## To be copied in the server
# mod_home_server("home_1")
