#shapiro wilk test for Rating
library(dplyr)
# in csv file
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

#randomly selecting only 5000 elements for shapiro-wilk
set.seed(123)
sampled_rating <- sample(Rating, 5000)
shapiro.test(sampled_rating)

#Sectioning off only Plays
Plays <- game_data$Plays

#sorting data so that 'K's are removed and results are multiplied by 1000 or if there is no 'K' then,
#to parse values as numeric
Plays <- suppressWarnings({ifelse(grepl('K', Plays), 
                                  as.numeric(gsub("K", "", Plays))* 1000,
                                  as.numeric(Plays))})

#randomly selecting 5000 elements from Plays for shapiro_wilk
set.seed(123)
sampled_plays <- sample(Plays, 5000)
shapiro.test(sampled_plays)
