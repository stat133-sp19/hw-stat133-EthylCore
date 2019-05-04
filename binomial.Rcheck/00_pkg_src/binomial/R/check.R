# Private function to check if prob in range
check_prob <- function(prob = -1){
  if (0<=prob & prob<=1){
    return(TRUE)
  } else {
    stop('Invalid probability value!')
  }
}

# Private function to check if trials is valid
check_trials <- function(trials = -1){
  if (trials>=0){
    return(TRUE)
  } else {
    stop('Invalid trials value!')
  }
}

# Private function to check if success value is valid
check_success <- function(success = c(-1), trials = -1){
  if (any(success <= -1)){
    stop('Invalid success value!')
  }
  if (all(success <= trials)){
    return(TRUE)
  } else {
    stop('Success cannot be greater than trials!')
  }
}
