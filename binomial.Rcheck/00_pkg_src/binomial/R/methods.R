library(ggplot2)

#' @export
plot.bindis <- function(bindis) {
  ggplot(data=bindis, aes(x=success, y=probability)) + geom_bar(stat="identity", alpha = .5)
}

#' @export
plot.bincum <- function(bincum) {
  ggplot(data=bincum, aes(x=success, y=cumulative)) + xlab('successes') + ylab('probability') + geom_line(stat="identity")
}

#' @export
print.binvar <- function(binvar) {
  cat('"Binomial variable"\n\nParameters\n- number of trials: ')
  cat(sprintf('%s', binvar['trials']), '\n')
  cat('- prob of success : ')
  cat(sprintf('%s', binvar['prob']))
}

#' @export
summary.binvar <- function(binvar) {
  trials <- binvar[["trials"]]
  prob <- binvar[["prob"]]
  summary <- list(trials = trials,
                  prob = prob,
                  mean= aux_mean(trials, prob),
                  variance = aux_variance(trials, prob),
                  mode = aux_mode(trials, prob),
                  skewness = aux_skewness(trials, prob),
                  kurtosis = aux_kurtosis(trials, prob))
  class(summary) <- "summary.binvar"
  return (summary)
}

#' @export
print.summary.binvar <- function(summary) {
  cat('"Summary Binomial"\n\nParameters\n- number of trials: ')
  cat(sprintf('%s', summary['trials']), '\n')
  cat('- prob of success : ')
  cat(sprintf('%s', summary['prob']), "\n")
  cat("\nMeasures", "\n- mean    : ")
  cat(sprintf('%s', summary['mean']), "\n")
  cat("- variance:",sprintf('%s', summary['variance']), "\n")
  cat("- mode    :",sprintf('%s', summary['mode']), "\n")
  cat("- skewness:",sprintf('%s', summary['skewness']), "\n")
  cat("- kurtosis:",sprintf('%s', summary['kurtosis']), "\n")
}
