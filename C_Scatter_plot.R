#scatterplot of Plays against Rating
library(ggplot2)

# reading in csv file
game_data <- read.csv("C:/Users/zeap2/OneDrive/Desktop/Important/MMU_learning/Statistical Data Analysis/Assignment/backloggd_games.csv", na.strings = "N/A")

# removing N/A values
game_data <- na.omit(game_data)

#Storing Plays from game_data into Plays
Plays <- game_data$Plays

# Processing Plays to become accurate 
# numeric representations
# of Plays, and storing in Plays
Plays <- suppressWarnings({ifelse(grepl('K', Plays), 
                                  as.numeric(gsub("K", "", Plays))* 1000,
                                  as.numeric(Plays))})
# Storing Rating from game_data into Rating
Rating <- as.numeric(game_data$Rating)

ggplot(data=NULL, 
       aes(x= Plays, y = Rating)) +
  geom_point(color="red", 
             alpha= 0.1) +
  ggtitle("Scatter Plot of Plays against Rating") + 
  geom_smooth(method="lm", 
              formula = y ~ x + 0, 
              color= "blue", se=FALSE) +
  ylim(0,5) +
  theme_minimal() 