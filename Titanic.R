install.packages("tidyverse")
data("Titanic")


head(Titanic)
View(Titanic)
library(ggplot2)
library(tidyverse)

Titanic$sex <- as.factor(Titanic$sex)
Titanic$Pclass <- as.factor(Titanic$Pclass)
Titanic$Survived <- as. factor(Titanic$Survived)


ggplot(Titanic, aes(x = Survived)) +
  geom_bar()


prop.table(table(Titanic$Survived))


ggplot(Titanic, aes(x = Survived))+
  theme_bw()+
  geom_bar()+
  labs(y = "passanger count",
       title = "Titanic survival rates")


ggplot(Titanic, aes(x = sex, fill = Survived))+
  theme_bw()+
  facet_wrap(~ Pclass)+
  geom_bar()+
  labs(y = "passenger count",
       title = "Titanic survival rates by Pclass and sex")



ggplot(Titanic, aes(x= Age))+
  theme_bw()+
  geom_histogram(binwidth = 5)+
  labs(y = "passenger count",
       x = "Age (binwidth = 5)",
       title = "Titanic Age Distribtion)"
       
       
      
ggplot(Titanic, aes(x= Age, fill = Survived))+
  theme_bw()+
  geom_histogram(binwidth = 5)+
  labs(y = "age",
       x = "Survived",
       title = "Titanic Survived rate by age, Pclass and sex")
