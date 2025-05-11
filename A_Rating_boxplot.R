#Rating Boxplot
#reading in csv file
game_data <- read.csv("C:/Users/zeap2/OneDrive/Desktop/Important/MMU_learning/Statistical Data Analysis/Assignment/backloggd_games.csv", na.strings = "N/A")

#removing N/A values
game_data <- na.omit(game_data)

#calculating mean, median, mode, std deviation,
#variance, range, quartiles, IQR and CV for rating.
Rating <- as.numeric(game_data$Rating)

boxplot(Rating, main="Boxplot of Rating")