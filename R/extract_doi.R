extract_doi <- function(cite_string) {
  doi_pattern1 <- "(?<=https://doi.org/)(.+)"
  doi_pattern2 <- "(?<=DOI: )(.+)"
  doi_pattern <- paste0(doi_pattern1, "|", doi_pattern2)
  stringr::str_extract(cite_string, doi_pattern)
}
