library(stringr)

extract_doi <- function(cite_string) {
  doi_pattern <- "(?<=https://doi.org/)(.+)"
  str_extract(cite_string, doi_pattern)
}
