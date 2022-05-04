#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
#' @importFrom magrittr %>%
app_server <- function(input, output, session) {
  # Your application server logic
  mod_home_server("home_1")
  mod_variable_overview_server("variable_overview_1")
  mod_densityplots_server("densityplots_1")
  mod_PCA_plots_server("PCA_plots_1")
}
