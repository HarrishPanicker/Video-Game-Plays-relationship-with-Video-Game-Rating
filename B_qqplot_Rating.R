#QQplot for Rating
library(ggplot2)

#reading in csv file
game_data <- read.csv("C:/Users/zeap2/OneDrive/Desktop/Important/MMU_learning/Statistical Data Analysis/Assignment/backloggd_games.csv", na.strings = "N/A")

#removing N/A values
game_data <- na.omit(game_data)

#set function for mode
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

#calculating mean, median, mode, std deviation,
#variance, range, quartiles, IQR and CV for rating.
Rating <- as.numeric(game_data$Rating)

qqnorm(Rating, main="Q-Q plot of Rating")
qqline(Rating, col="blue", lw = 2)

