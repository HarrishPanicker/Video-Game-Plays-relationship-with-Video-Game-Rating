#mean, median, mode, standard deviation, variance

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

mean_rating <- mean(Rating)

median_rating <- median(Rating)

std_dev_rating <- sd(Rating)

variance_rating <- var(Rating)

range_rating <- range(Rating)

IQR_rating <- IQR(Rating)

cv_rating <- std_dev_rating / mean_rating * 100

Number_playing <- game_data$Playing

cat("Mean Rating: ", mean_rating, "\n")
cat("Mode Rating:", getmode(Rating), "\n")

cat("Median Rating: ", median_rating, "\n")

cat("Standard Deviation of Rating: ", 
    std_dev_rating, "\n")

cat("Variance: ", 
    variance_rating, "\n")
cat("Range: ", 
    range_rating[1], "to", 
    range_rating[2], "\n")

# Add full summary before IQR
cat("\n--- Summary of Rating ---\n")
print(summary(Rating))

cat("\nInterquartile Range (IQR) of Rating: ", 
    IQR_rating, "\n")

cat("Coefficient of Variation (CV) of Rating: ", 
    cv_rating, "%\n")
