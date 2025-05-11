#QQplot for Plays
# reading in csv file
game_data <- read.csv("C:/Users/zeap2/OneDrive/Desktop/Important/MMU_learning/Statistical Data Analysis/Assignment/backloggd_games.csv", na.strings = "N/A")

# removing N/A values
game_data <- na.omit(game_data)

# set function for mode
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# calculating mean, median, mode, std deviation,
# variance, range, quartiles, IQR and CV for Plays.
Plays <- game_data$Plays

Plays <- suppressWarnings({ifelse(grepl('K', Plays), 
                                  as.numeric(gsub("K", "", Plays))* 1000,
                                  as.numeric(Plays))})

qqnorm(Plays, main="Q-Q plot of Plays")
qqline(Plays, col="red", lw= 2)