## --------------
## title: shots-data
## description: Script to create a csv data file that will contain the required variables to be used in the visualization phase.
## input(s): csv file of a player
## output(s): Dataset of shots attempted by a player to be used in visualization.
## --------------
library(readr)

classes = c('character', 'character', 'character', 'integer', 'integer', 'integer', 'character', 'character', 'character', 'integer', 'factor', 'integer', 'integer')

curry <- read.csv("../data/stephen-curry.csv", colClasses = classes, stringsAsFactors = FALSE)
iguodala <- read.csv("../data/andre-iguodala.csv", colClasses = classes, stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", colClasses = classes, stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", colClasses = classes, stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", colClasses = classes, stringsAsFactors = FALSE)

curry$name <- 'Stephen Curry'
iguodala$name <- 'Andre Iguodala'
durant$name <- 'Kevin Durant'
thompson$name <- 'Klay Thompson'
green$name <- 'Draymond Green'

curry$shot_made_flag[curry$shot_made_flag == 'n'] <- 'shot_no'
curry$shot_made_flag[curry$shot_made_flag == 'y'] <- 'shot_yes'
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] <- 'shot_no'
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] <- 'shot_yes'
durant$shot_made_flag[durant$shot_made_flag == 'n'] <- 'shot_no'
durant$shot_made_flag[durant$shot_made_flag == 'y'] <- 'shot_yes'
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] <- 'shot_no'
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] <- 'shot_yes'
green$shot_made_flag[green$shot_made_flag == 'n'] <- 'shot_no'
green$shot_made_flag[green$shot_made_flag == 'y'] <- 'shot_yes'

curry$minute <- (curry$period*12) - curry$minutes_remaining
iguodala$minute <- (iguodala$period*12) - iguodala$minutes_remaining
durant$minute <- (durant$period*12) - durant$minutes_remaining
thompson$minute <- (thompson$period*12) - thompson$minutes_remaining
green$minute <- (green$period*12) - green$minutes_remaining

sink(file= '../output/steph-curry-summary.txt')
summary(curry)
sink()
sink(file= '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()
sink(file= '../output/kevin-durant-summary.txt')
summary(durant)
sink()
sink(file= '../output/klay-thompson-summary.txt')
summary(thompson)
sink()
sink(file= '../output/draymond-green-summary.txt')
summary(green)
sink()

gsw = rbind(curry, iguodala, durant, thompson, green)
write.csv(x=gsw, file='../data/shots-data.csv')
sink(file= '../output/shots-data-summary.txt')
summary(gsw)
sink()
