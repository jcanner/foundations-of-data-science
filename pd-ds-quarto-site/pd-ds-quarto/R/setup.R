required <- c("tidyverse", "broom", "modelr", "knitr")
missing <- required[!vapply(required, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing) > 0) {
  stop("Please install required packages first: install.packages(c(", paste(sprintf('\\"%s\\"', missing), collapse = ", "), "))")
}
library(tidyverse)
library(broom)
library(modelr)
library(knitr)
set.seed(2026)
project_file <- function(...) {
  candidates <- c(file.path(...), file.path("..", ...), file.path(".", ...))
  hit <- candidates[file.exists(candidates)]
  if (length(hit)) hit[[1]] else candidates[[1]]
}
load_fish <- function() {
  path <- project_file("data", "fish_sample.csv")
  if (file.exists(path)) {
    readr::read_csv(path, show_col_types = FALSE)
  } else {
    tibble(
      Species = rep(c("Bream", "Roach", "Pike", "Smelt", "Perch"), each = 24),
      Length1 = runif(120, 8, 55),
      Length2 = Length1 * runif(120, 1.01, 1.08),
      Length3 = Length1 * runif(120, 1.07, 1.16),
      Height = Length1 * runif(120, .22, .38) + rnorm(120, 0, .7),
      Width = Length1 * runif(120, .07, .14) + rnorm(120, 0, .2),
      Weight = pmax(.018 * Length1^3 + rnorm(120, 0, 70), 5)
    )
  }
}
