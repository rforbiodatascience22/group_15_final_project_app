#' helpers
#'
#' @description A fct function
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd
#'

#library('tidyverse')
# Get filenames from main repository
path_from = "https://raw.githubusercontent.com/rforbiodatascience22/2022_group15_final_project/main/"
filenames = c("R/01_load.R",
              "R/02_clean.R",
              "R/03_augment.R",
              "R/99_project_functions.R",
              "data/_raw/BRCA2.csv")

# Download files from main repository
dir.create(file.path("data", "data/_raw"), showWarnings = FALSE)
for (filename in filenames) {

  file = read_file(str_c(path_from, filename))
  write_file(x=file,
            path = filename)
}

boldtext <- function (text)
{
  tagList(h4(text))
}


