library(citework)


test_that("test minimum size function", {
  test_graph <- igraph::sample_gnp(10, 0.8, directed = TRUE)
  min_val <- 10
  sizes <- citework::calc_nodesize_(test_graph, min_size = min_val)
  testthat::expect_equal(min(sizes), min_val)
})

