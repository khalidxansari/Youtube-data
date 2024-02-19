
#setup directory
setwd(setwd("D:/Kings College/Data Visualization/Youtube Channel")
)
#name your dataset
youtube_data <- read.csv("D:/Kings College/Data Visualization/Youtube Channel/youtube.csv")

#structure the data
str(youtube_data)

#summary 
summary(youtube_data)

# Convert factors to characters if necessary
youtube_data$Geography <- as.character(youtube_data$Geography)

# Convert date from character to Date type if necessary
youtube_data$Date <- as.Date(youtube_data$Date, format = "%Y-%m-%d")


install.packages("ggplot2")

library(ggplot2)

# Assuming you're using 'Views' for the x-axis and 'Watch.time..hours.' for the y-axis

ggplot(youtube_data, aes(x = Views, y = Watch.time..hours.)) +
  geom_point() +  # Add points
  facet_wrap(~ Geography) +  # Create facets for each geography
  theme_minimal() +  # Optional: Adds a minimalistic theme
  labs(title = "YouTube Views vs. Watch Time by Geography",
       x = "Views",
       y = "Watch Time (Hours)")




# Correcting the column name and trimming white spaces
youtube_data$VideoPublishTime <- trimws(youtube_data$video.publish.time)

# Converting to Date format
youtube_data$VideoPublishTime <- as.Date(youtube_data$VideoPublishTime, format = "%B %d, %Y")

library(ggplot2)

ggplot(youtube_data, aes(x = VideoPublishTime, y = Views)) +
  geom_line(group = 1) +
  labs(title = "Trend of Views Over Time",
       x = "Publication Date",
       y = "Views") +
  theme_minimal()


