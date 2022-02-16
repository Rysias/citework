library(httr)

# INPUT REMOVE LATER
doi <- "10.1177/0956797612460691"


get_paper_refs <- function(doi) {
  api_url <- "https://api.semanticscholar.org/graph/v1/paper/"
  full_request <-
    paste0(api_url, "DOI:", doi, "?fields=references.paperId")
  parsed <- content(GET(full_request), as = "parsed", type = "application/json")

  paper_id <- parsed$paperId
  references <- unname(unlist(parsed$references))
  return(tibble(from=paper_id, to=references))
}
