# Data Science Integration for Lower-Division Courses

Quarto website scaffold generated from the attached professional development outline.

## To preview

```bash
quarto preview
```

## To render

```bash
quarto render
```

## R packages

Install once if needed:

```r
install.packages(c("tidyverse", "broom", "modelr", "knitr"))
```

## Structure

- `index.qmd`: course overview and module structure
- `courses/`: one Quarto page per course
- `data/fish_sample.csv`: small sample dataset for examples
- `R/setup.R`: shared R setup and data-loading function
