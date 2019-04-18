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

thompson_shot_chart <- ggplot(data=thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x,y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016-2017 season)')

curry_shot_chart <- ggplot(data=curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x,y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Steph Curry (2016-2017 season)')

durant_shot_chart <- ggplot(data=durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x,y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016-2017 season)')

green_shot_chart <- ggplot(data=green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x,y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016-2017 season)')

iguodala_shot_chart <- ggplot(data=iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x,y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016-2017 season)')

pdf(file="../images/andre-iguodala-shot-chart.pdf", width=6.5, height=5)
iguodala_shot_chart
dev.off()

pdf(file="../images/draymond-green-shot-chart.pdf", width=6.5, height=5)
green_shot_chart
dev.off()

pdf(file="../images/kevin-durant-shot-chart.pdf", width=6.5, height=5)
durant_shot_chart
dev.off()

pdf(file="../images/klay-thompson-shot-chart.pdf", width=6.5, height=5)
thompson_shot_chart
dev.off()

pdf(file="../images/stephen-curry-shot-chart.pdf", width=6.5, height=5)
curry_shot_chart
dev.off()

gsw_shot_chart <- ggplot(data=gsw) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x=x,y=y, color = shot_made_flag)) +
  ylim(-50, 420) +
  facet_wrap(~ name) +
  ggtitle('Shot Chart: GSW (2016-2017 season)')

pdf(file="../images/gsw-shot-charts.pdf", width=8, height=7)
gsw_shot_chart
dev.off()

png(file="../images/gsw-shot-charts.png", width=8, height=7, units = 'in', res = 150)
gsw_shot_chart
dev.off()

