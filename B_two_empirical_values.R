# reading in csv file
game_data <- read.csv("C:/Users/zeap2/OneDrive/Desktop/Important/MMU_learning/Statistical Data Analysis/Assignment/backloggd_games.csv", na.strings = "N/A")

# removing N/A values
game_data <- na.omit(game_data)

Plays <- game_data$Plays

Plays <- suppressWarnings({ifelse(grepl('K', Plays), 
                                  as.numeric(gsub("K", "", Plays))* 1000,
                                  as.numeric(Plays))})
Rating <- as.numeric(game_data$Rating)

# For Plays
mean_plays <- mean(Plays)
sd_plays <- sd(Plays)

within_1sd_plays <- sum(Plays >= (mean_plays - sd_plays) & Plays <= (mean_plays + sd_plays)) / length(Plays) * 100
within_2sd_plays <- sum(Plays >= (mean_plays - 2*sd_plays) & Plays <= (mean_plays + 2*sd_plays)) / length(Plays) * 100
within_3sd_plays <- sum(Plays >= (mean_plays - 3*sd_plays) & Plays <= (mean_plays + 3*sd_plays)) / length(Plays) * 100

cat("Plays: \n")
cat("Within 1 SD: ", within_1sd_plays, "%\n")
cat("Within 2 SD: ", within_2sd_plays, "%\n")
cat("Within 3 SD: ", within_3sd_plays, "%\n")

# For Rating
Ratings <- game_data$Rating
mean_rating <- mean(Ratings)
sd_rating <- sd(Ratings)

within_1sd_rating <- sum(Ratings >= (mean_rating - sd_rating) & Ratings <= (mean_rating + sd_rating)) / length(Ratings) * 100
within_2sd_rating <- sum(Ratings >= (mean_rating - 2*sd_rating) & Ratings <= (mean_rating + 2*sd_rating)) / length(Ratings) * 100
within_3sd_rating <- sum(Ratings >= (mean_rating - 3*sd_rating) & Ratings <= (mean_rating + 3*sd_rating)) / length(Ratings) * 100

cat("\nRating: \n")
cat("Within 1 SD: ", within_1sd_rating, "%\n")
cat("Within 2 SD: ", within_2sd_rating, "%\n")
cat("Within 3 SD: ", within_3sd_rating, "%\n")