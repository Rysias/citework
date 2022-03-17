#' Calculating network metrics


parse_year_ <- function(charvec) {
  as.numeric(str_extract(charvec, "\\d{4}"))
}

#' Assumes that nodes has column year
papers_per_year_ <- function(tidy_network) {
tidy_network %>%
  tidygraph::as_tibble() %>%
  group_by(year) %>%
  summarise(n_papers = n()) %>%
  mutate(total_papers = cumsum(n_papers)) %>%
  select(year, total_papers)
}

refcount_ <- function(tidy_network) {
  tidy_network %>%
    activate(edges) %>%
    as_tibble %>%
    group_by(id = from) %>%
    summarise(refcount = n())
}

add_cite_pct <- function(tidy_citework) {
  tidywork <- tidy_citework %>%
    mutate(year = parse_year_(name),
           id = row_number())

  papers_per_year <- papers_per_year_(tidywork)
  ref_count <- refcount_(tidywork)

  tidywork %>%
    left_join(papers_per_year) %>%
    left_join(ref_count) %>%
    mutate(cite_pct = refcount / total_papers) %>%
    select(-c(total_papers, refcount))
}
