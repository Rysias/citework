extract_doi <- function(cite_string) {
  doi_pattern <- "(10\\.\\d{4,5}\\/[\\S]+[^;,.\\s])"
  stringr::str_extract(cite_string, doi_pattern)
}
