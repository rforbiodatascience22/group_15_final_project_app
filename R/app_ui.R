#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    fluidPage(
      h1("BreastCancerExplorer"),
      tabsetPanel(
        tabPanel(title = "Home",
                 mod_home_ui("home_1")),
        tabPanel(title = "Variable overview",
                 mod_variable_overview_ui("variable_overview_1")),
        tabPanel(title = "Density Plot",
                 mod_densityplots_ui("densityplots_1")),
        tabPanel(title = "PCA Plots",
                 mod_densityplots_ui("PCA_plots_1"))
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "BreastCancerExplorer"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
