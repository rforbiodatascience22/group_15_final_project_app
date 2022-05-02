#' helpers
#'
#' @description A fct function
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd
#'
source(file = "project_files/R/00_doit.R")

boldtext <- function (text)
{
  tagList(h4(text))
}

boxplot_brca <- function(data, attribute1, attribute2, attribute3){
  my_plot <- data %>%
    ggplot2::ggplot(ggplot2::aes_string(x = attribute1,
                                 y = attribute2,
                                 color = attribute3)) +
    ggplot2::geom_boxplot() +
    ggplot2::theme_bw() +
    ggplot2::labs(x = stringr::str_replace(attribute1,'_',' '),
                  y = attribute2)
  return(my_plot)
}
