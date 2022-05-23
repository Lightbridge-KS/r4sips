# knitr chunk options ----------------------------------------------------------

## From: https://github.com/OpenIntroStat/ims/blob/main/_common.R
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  cache = FALSE, # only use TRUE for quick testing!
  echo = TRUE, # not hide code
  fig.align = "center",
  fig.width = 6,
  fig.asp = 0.618,  # 1 / phi
  fig.show = "hold",
  dpi = 300,
  fig.pos = "h"
)

# Printing Table ----------------------------------------------------------


## From: https://bookdown.org/yihui/rmarkdown-cookbook/opts-render.html

yihui_print <- function(x, ...) {
  res = paste(c("", "", knitr::kable(x)), collapse = "\n")
  knitr::asis_output(res)
}


## From: https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_html.html#Bootstrap_table_classes
kableExtra_print <- function(x, ...){

  res <- kableExtra::kbl(x)
  res  <- kableExtra::kable_styling(res, bootstrap_options = c("hover"))

  knitr::asis_output(res)

}

## Generic: knit_print for data.frame

knit_print.data.frame <-  function(x, ...) {

  kableExtra_print(x, ...)
}

## Generic: knit_print for Tibble

knit_print.tbl_df <-  function(x, ...) {

  kableExtra_print(x, ...)
}


# Register Method

registerS3method(
  "knit_print", "data.frame", knit_print.data.frame,
  envir = asNamespace("knitr")
)

registerS3method(
  "knit_print", "tbl_df", knit_print.tbl_df,
  envir = asNamespace("knitr")
)


# Plot Setting ------------------------------------------------------------

if (knitr::is_html_output()) {
  ggplot2::theme_set(ggplot2::theme_minimal(base_size = 12))
} else if (knitr::is_latex_output()) {
  ggplot2::theme_set(ggplot2::theme_minimal(base_size = 11))
}