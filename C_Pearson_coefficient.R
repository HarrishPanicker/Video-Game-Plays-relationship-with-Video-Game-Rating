#Pearson Coefficient
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

mean_Plays <- mean(Plays)
mean_Rating <- mean(Rating)

Sxx <- (sum((Plays - mean_Plays)^2))
Syy <- (sum((Rating - mean_Rating)^2))
Sxy <- (sum((Plays - mean_Plays) * (Rating - mean_Rating)))
        
r <- Sxy / (sqrt(Sxx * Syy))

r
