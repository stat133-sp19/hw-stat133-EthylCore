context("Check binomial arguments")

library(testthat)

test_that("check_prob is correct", {
  expect_true(check_prob(.1))
  expect_error(check_prob(-10))
  expect_error(check_prob())
})
