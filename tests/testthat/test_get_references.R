library(citework)

doi1 <- "10.1177/0956797612460691"
doi2 <- "10.1016/j.cognition.2018.04.008"
refs <- get_paper_refs(doi1)



test_that("Can create a tibble from doi", {
  testthat::expect_s3_class(refs, "data.frame")
})

test_that("Only one unique from", {
  testthat::expect_equal(length(unique(refs$from)), 1)
})

ref_edges <- create_ref_edges(c(doi1, doi2))

test_that("Create right number of froms", {
  testthat::expect_equal(length(unique(ref_edges$from)), 2)
})


test_that("replace name in citation frame", {
  ref_edges <- tibble::tibble(from=c("1", "1", "2", "2", "3"), to=c("2", "3", "1", "1", "2"))
  new_names <- c("a", "b", "c")

  replaced_edges <- ids_to_names(ref_edges, new_names)

  testthat::expect_s3_class(replaced_edges, "data.frame")
  testthat::expect_equal(names(replaced_edges), c("from", "to"))
  testthat::expect_true(all(replaced_edges$to %in% new_names))
})
