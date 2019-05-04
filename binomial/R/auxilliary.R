# Private function for mean of binomial dist.
aux_mean <- function(trials, prob) {
  return (trials*prob)
}

# Private function for variance of binomial dist.
aux_variance <- function(trials, prob) {
  return ((trials*prob) * (1-prob))
}

# Private function for mode of binomial dist.
aux_mode <- function(trials, prob) {
  return (floor(trials*prob + prob))
}

# Private function for skewness of binomial dist.
aux_skewness <- function(trials, prob) {
  return ((1-(2*prob)) / sqrt(trials*prob*(1-prob)))
}

# Private function for Kurtosis of binomial dist.
aux_kurtosis <- function(trials, prob) {
  return ((1-(6*prob*(1-prob))) / (trials*prob*(1-prob)))
}
