#Plays boxplot
# reading in csv file
game_data <- read.csv("C:/Users/zeap2/OneDrive/Desktop/Important/MMU_learning/Statistical Data Analysis/Assignment/backloggd_games.csv", na.strings = "N/A")

# removing N/A values
game_data <- na.omit(game_data)

Plays <- game_data$Plays

Plays <- suppressWarnings({ifelse(grepl('K', Plays), 
                                  as.numeric(gsub("K", "", Plays))* 1000,
                                  as.numeric(Plays))})

boxplot(Plays, main="Boxplot of Plays")
