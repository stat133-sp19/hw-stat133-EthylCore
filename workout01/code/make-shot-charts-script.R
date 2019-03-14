## ---------------
## Title: Make Shot Charts Script
## Description: Script to create visualization of shots attempted by a GSW player.
## Input(s): CSV file for the GSW players
## Output(s): Graphical representations of shots attempted by a player.
## ---------------

library(ggplot2)
install.packages('jpeg')
library(jpeg)
library(grid)

# scatterplot
klay_scatterplot <- ggplot(data=thompson) +
  geom_point(aes(x=x,y=y, color = shot_made_flag))

# court image (to be used as background of plot)
court_file <- "../images/nba-court.jpg"

# create raste object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

klay_shot_chart <- ggplot(data=)