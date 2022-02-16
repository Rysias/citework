extract_doi <- function(cite_string) {
  doi_pattern <- "(?<=https://doi.org/)(.+)"
  stringr::str_extract(cite_string, doi_pattern)
}
