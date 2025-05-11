#Detailed Summary for Plays
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


mean_plays <- mean(Plays)
median_plays <- median(Plays)
std_dev_plays <- sd(Plays)
variance_plays <- var(Plays)
range_plays <- range(Plays)
IQR_plays <- IQR(Plays)
cv_plays <- std_dev_plays / mean_plays * 100

cat("Mean Plays: ", mean_plays, "\n")
cat("Mode Plays: ", getmode(Plays), "\n")
cat("Median Plays: ", median_plays, "\n")
cat("Standard Deviation of Plays: ", std_dev_plays, "\n")
cat("Variance: ", variance_plays, "\n")
cat("Range: ", range_plays[1], "to", range_plays[2], "\n")

# Add full summary before IQR
cat("\n--- Summary of Plays ---\n")
print(summary(Plays))

cat("\nInterquartile Range (IQR) of Plays: ", IQR_plays, "\n")
cat("Coefficient of Variation (CV) of Plays: ", cv_plays, "%\n")
