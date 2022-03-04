library(citework)


test_that("test minimum size function", {
  test_graph <- igraph::sample_gnp(10, 0.8, directed = TRUE)
  sizes <- citework::calc_nodesize_(test_graph)
  testthat::expect_equal(min(sizes), 1)
})

