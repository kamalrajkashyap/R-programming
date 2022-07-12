# Explore 
# Clean
# manipulate
# Describe
# Visualise
# Analyse

# install("tidyverse")
library(tidyverse)
data()
?starwars
dim(starwars)
str(starwars)
glimpse(starwars)
View(starwars)
head(starwars)
tail(starwars)
starwars$name

attach(starwars)
names(starwars)
length(starwars)
class(hair_color)
lenght(hair_color)
unique(hair_color)

view(short(table(hair_color), decreasing = TRUE))
barplot(sort(table(hair_color), decreasing = TRUE))
barplot(sort(table(eye_color), decreasing = TRUE))

starwars %>%
  select(hair_color) %>%
  count(hair_color) %>%
  arrange(desc(n)) %>%
  View()

starwars[ , ]

View(starwars[is.na(hair_color), ])


class(height)
length(height)
summary(height)
boxplot(height)
hist(height)