context("Check binomial arguments")

library(testthat)

test_that("check_prob is correct", {
  expect_true(check_prob(.1))
  expect_error(check_prob(-10))
  expect_error(check_prob(3))
})

test_that("check_trials is correct", {
  expect_true(check_trials(5))
  expect_error(check_trials(-10))
  expect_error(check_trials(5.5))
})

test_that("check_success is correct", {
  expect_true(check_success(c(1, 2, 3), 4))
  expect_error(check_success(c(1, 2, 3), 2))
  expect_error(check_success(c(2.4, 2, 3), 7))
})

test_that("aux_mean is correct", {
  expect_true(aux_mean(10, .3) == 3)
  expect_true(aux_mean(5, .1) == .5)
  expect_true(aux_mean(-1, 5) == -5)
})
test_that("aux_variance is correct", {
  expect_true(all.equal(aux_variance(10, .3), 2.1))
  expect_error(aux_variance('c', 4))
  expect_error(aux_variance(3, '3'))
})
test_that("aux_mode is correct", {
  expect_true(aux_mode(10, .3) == 3)
  expect_error(aux_mode('c', 4))
  expect_error(aux_mode(3, '3'))
})
test_that("aux_skewness is correct", {
  expect_true(all.equal(round(aux_skewness(10, .3), digits=7), 0.2760262))
  expect_error(aux_skewness('c', 4))
  expect_error(aux_skewness(3, '3'))
})
test_that("aux_kurtosis is correct", {
  expect_true(all.equal(round(aux_kurtosis(10, .3),digits=7), -0.1238095))
  expect_error(aux_kurtosis('c', 4))
  expect_error(aux_kurtosis(3, '3'))
})
test_that("bin_choose is correct", {
  expect_true(bin_choose(5, 2) == 10)
  expect_error(bin_choose(3,9))
  expect_true(all.equal(bin_choose(5, 1:3), c(5, 10, 10)))
})
test_that("bin_probability is correct", {
  expect_true(bin_probability(2, 5, .5) == 0.3125)
  expect_true(all.equal(bin_probability(0:2, 5, 0.5), c(.03125, .15625, .31250)))
  expect_true(round(bin_probability(55, 100, .45), digits = 8) == .01075277)
  expect_error(bin_probability(5.5, 2.3, .3))
})
test_that("bin_distribution is correct", {
  expect_true(all.equal(class(bin_distribution(5, .5)), c("bindis", "data.frame")))
  expect_error(bin_distribution(-1, 0.5))
  expect_error(bin_distribution(2.5, 0.45))
})
test_that("bin_cumulative is correct", {
  expect_true(all.equal(class(bin_cumulative(5, .5)), c("bincum", "data.frame")))
  expect_error(bin_cumulative(-1, 0.5))
  expect_error(bin_cumulative(2.5, 0.45))
})
