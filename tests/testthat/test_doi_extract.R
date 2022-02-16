library(citework)
library(testthat)

test_that("extracting DOI single", {
  cite_string <- "Ramscar, M., Dye, M., & Klein, J. (2013). Children Value Informativity Over Logic in Word Learning. Psychological Science, 24(6), 1017–1023. https://doi.org/10.1177/0956797612460691"
  expect_equal(extract_doi(cite_string), "10.1177/0956797612460691")
})

test_that("extracting DOI vector", {
  cite_string1 <- "Ramscar, M., Dye, M., & Klein, J. (2013). Children Value Informativity Over Logic in Word Learning. Psychological Science, 24(6), 1017–1023. https://doi.org/10.1177/0956797612460691"
  cite_string2 <- "Aravind, A., de Villiers, J., Pace, A., Valentine, H., Golinkoff, R., Hirsh-Pasek, K., … Sweig Wilson, M. (2018). Fast mapping word meanings across trials: Young children forget all but their first guess. Cognition, 177(April), 177–188. https://doi.org/10.1016/j.cognition.2018.04.008"
  cite_vec <- c(cite_string1, cite_string2)
  expect_equal(extract_doi(cite_vec), c("10.1177/0956797612460691","10.1016/j.cognition.2018.04.008"))
})
