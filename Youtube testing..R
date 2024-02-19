
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




# Load libraries
library(ggplot2)

library(dplyr)
top_countries <- head(youtube_data[order(youtube_data$Views, decreasing = TRUE),], 5)

# Install and load ggplot2
install.packages("ggplot2")
library(ggplot2)

# Assuming your data is in a data frame called 'youtube_data'

# Sorting and selecting the top 5 countries based on Views
top_countries <- head(youtube_data[order(youtube_data$Views, decreasing = TRUE),], 5)

# Creating the bar chart
ggplot(top_countries, aes(x = reorder(Geography, Views), y = Views)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  theme_minimal() +
  labs(title = "Top 5 Countries by YouTube Views",
       x = "Country",
       y = "Views") +
  coord_flip()  # Flips the axes for a horizontal bar chart


