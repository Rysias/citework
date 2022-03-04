# INPUT REMOVE LATER
#doi <- "10.1177/0956797612460691"


get_paper_refs <- function(doi) {
  api_url <- "https://api.semanticscholar.org/graph/v1/paper/"
  full_request <-
    paste0(api_url, "DOI:", doi, "?fields=references.paperId")
  parsed <-
    httr::content(httr::GET(full_request), as = "parsed", type = "application/json")

  paper_id <- parsed$paperId
  references <- unname(unlist(parsed$references))
  return(tidyr::tibble(from = paper_id, to = references))
}

create_ref_edges <- function(doi_vec) {
  purrr::map_dfr(doi_vec, get_paper_refs)
}

ids_to_names <- function(ref_edges, names) {
  unique_ids <- unique(ref_edges$from)
  map <- setNames(names, unique_ids)

  ref_matrix <- as.matrix(ref_edges)
  tibble::as_tibble(matrix(map[ref_matrix], nrow=nrow(ref_matrix), dimnames=dimnames(ref_matrix)))
}

direct_citation <- function(names, doi_vec) {
  stopifnot(length(names) == length(doi_vec))
  raw_ref_edges <- create_ref_edges(doi_vec) %>%
    dplyr::filter(to %in% from) %>%
    ids_to_names(names) %>%
    tidyr::drop_na()
}
