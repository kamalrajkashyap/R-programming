# Explore
# Clean
# Manipulate
# Describe and summarise
# Visualise
# Analyse


###################################
###### Cleaning Data###############
###################################

library(tidyverse)
data()
View(starwars)

glimpse(starwars)
class(starwars$gender)
unique(starwars$gender)

starwars$gender <- as.factor(starwars$gender)
class(starwars$gender)

levels(starwars$gender)

starwars$gender <- factor((starwars$gender),
                           levels = c("masculine",
                                      "feminine"))
levels(starwars$gender)

# Select variables

names(starwars)

starwars %>%
  select(name, height,ends_with("color")) %>%
  name()


# Filter observations

unique %>%
  select(name, height, ends_with("color")) %>%
  filter(hair_color %in% c("blond", "brown") &
           height < 180) %>%
  

# Missing data
  
mean(starwars$height, na.rm = TRUE)

starwars %>%
  select(name, gender, hair_color, height)

starwars %>%
  select(name, gender,hair_color, height) %>%
  na.omit()

starwarsb %>%
  select(name, gender, hair_color, height) %>%
  filter(!complete.cases(.))

starwars %>%
  select(name, gender, hire_color, height) %>%
  drop_na(height) %>%
  view()
starwars %>%
  select(name, gender,hair_color,height) %>%
  filter(!complete.cases(.)) %>%
  mutate(hair_color = replace_na(hair_color, "none"))


#Duplicates

Name <- c("Peter", "John", "Andrew", "Peter")
Age <- c(22, 33, 44, 22)

friends <- data.frame(Name. Age)

friends[!duplicated(friends), ]
friends %>% distinct()

# Recoding variables
starwars %>%
  select(name, gender) %>%
  mutate(name = recode(gender
                       "masculine" = 1,
                       "feminine" = 2))
