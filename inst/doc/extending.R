## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----add-template, eval = FALSE-----------------------------------------------
#  usethis::use_rmarkdown_template(
#    template_name = "Curriculum Vitae (My custom format)",
#    template_dir = "my_template",
#    template_description = "The custom vitae template made by me!",
#    template_create_dir = TRUE)

## -----------------------------------------------------------------------------
#' @rdname cv_formats
#' @export
my_template <- function(...) {
  template <- system.file("rmarkdown", "templates", "my_template",
                          "resources", "my_template.tex", package="vitae")
  
  set_entry_formats(moderncv_cv_entries)
  copy_supporting_files("my_template")
  cv_document(..., template = template)
}

