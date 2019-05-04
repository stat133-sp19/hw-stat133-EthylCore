# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

library(ggplot2)
#' @title Binary Choose
#' @description Returns the combination of k successes from n trials.
#' @param n Trials
#' @param k Successes
#' @return An integer
#' @export
bin_choose <- function(n, k){
  if (any(k>n)) {
    stop('k cannot be greater than n!')
  } else {
    return (factorial(n)/(factorial(k)*factorial(n-k)))
  }
}

#' @title Binary Probability
#' @description Returns the probability of k successes from n trials.
#' @param success Successes
#' @param trials Trials
#' @param prob Probability
#' @return A float
#' @export
bin_probability <- function(success, trials, prob){
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  return (bin_choose(trials, success)*(prob^success)*((1-prob)^(trials-success)))
}

#' @title Binary Distribution
#' @description Returns a probability table for successes from n trials.
#' @param trials Trials
#' @param prob Probability
#' @return A distribution table
#' @export
bin_distribution <- function(trials, prob){
  df = data.frame(success = 0:trials)
  df$probability = bin_probability(df$success, trials, prob)
  class(df) <- c("bindis", "data.frame")
  return (df)
}

#' @title Binary Cumulation
#' @description Returns a cumulative table for successes from distribution table.
#' @param trials Trials
#' @param prob Probability
#' @return A cumulative distribution table
#' @export
bin_cumulative <- function(trials, prob){
  df = bin_distribution(trials, prob)
  df$cumulative = cumsum(df$probability)
  class(df) <- c("bincum", "data.frame")
  return (df)
}

#' @title Binary Variable
#' @description Constructs a list with named elements trials and prob.
#' @param trials Trials
#' @param prob Probability
#' @return A list with named elements of class "binvar"
#' @export
bin_variable <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  bin_list <- list(trials = trials, prob = prob)
  class(bin_list) <- "binvar"
  return (bin_list)
}


#' @title Binary Mean
#' @description Returns mean of binomial variable
#' @param trials Trials
#' @param prob Probability
#' @return A number for mean
#' @export
bin_mean <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return (aux_mean(trials, prob))
}

#' @title Binary Variance
#' @description Returns variance of binomial variable
#' @param trials Trials
#' @param prob Probability
#' @return A number for variance
#' @export
bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return (aux_variance(trials, prob))
}

#' @title Binary Mode
#' @description Returns mode of binomial variable
#' @param trials Trials
#' @param prob Probability
#' @return An integer for mode
#' @export
bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return (aux_mode(trials, prob))
}

#' @title Binary Skewness
#' @description Returns skewness of binomial variable
#' @param trials Trials
#' @param prob Probability
#' @return A number for skewness
#' @export
bin_skewness <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return (aux_skewness(trials, prob))
}

#' @title Binary Kurtosis
#' @description Returns kurtosis of binomial variable
#' @param trials Trials
#' @param prob Probability
#' @return A number for kurtosis
#' @export
bin_kurtosis <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return (aux_kurtosis(trials, prob))
}
