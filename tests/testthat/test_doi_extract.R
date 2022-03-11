library(citework)

test_that("extracting DOI single", {
  cite_string <- "Ramscar, M., Dye, M., & Klein, J. (2013). Children Value Informativity Over Logic in Word Learning. Psychological Science, 24(6), 1017–1023. https://doi.org/10.1177/0956797612460691"
  expect_equal(extract_doi(cite_string), "10.1177/0956797612460691")
})

test_that("extracting tricky DOI", {
  cite_string <- "Wang, Y. & Seidl, A.  (2014). The Learnability of Phonotactic Patterns in Onset & Coda Positions, Language Learning & Development, DOI: 10.1080/15475441.2013.876270"
  expect_equal(extract_doi(cite_string), "10.1080/15475441.2013.876270")
})

test_that("extracting tricky DOI 2", {
  cite_string <-
    "Seidl, A., Schmale, R., & Cristia, A. (2019, February 13). Cross-accent word recognition in 9-month-olds after exposure to variable speakers. Retrieved from osf.io/wnc68. DOI 10.17605/OSF.IO/WNC68"
  expect_equal(extract_doi(cite_string),"10.17605/OSF.IO/WNC68")
})


test_that("extracting DOI vector", {
  cite_string1 <- "Ramscar, M., Dye, M., & Klein, J. (2013). Children Value Informativity Over Logic in Word Learning. Psychological Science, 24(6), 1017–1023. https://doi.org/10.1177/0956797612460691"
  cite_string2 <- "Aravind, A., de Villiers, J., Pace, A., Valentine, H., Golinkoff, R., Hirsh-Pasek, K., … Sweig Wilson, M. (2018). Fast mapping word meanings across trials: Young children forget all but their first guess. Cognition, 177(April), 177–188. https://doi.org/10.1016/j.cognition.2018.04.008"
  cite_vec <- c(cite_string1, cite_string2)
  expect_equal(extract_doi(cite_vec), c("10.1177/0956797612460691","10.1016/j.cognition.2018.04.008"))
})

test_that("Throws NA at no match", {
  expect_true(is.na(extract_doi("No string here doi:dslgkj")))
})
