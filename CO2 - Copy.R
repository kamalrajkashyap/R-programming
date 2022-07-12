library(tidyverse)

data()

view(co2)

co2 %>%
ggplot(aes(conc, uptake, 
           colour = Treatment))+
 gemo_point(size = 3, alpha = 0.5)+
 gemo_smooth(method = lm, se = F)
 facet_wrap(~Type)
 labs(title = "concentration of co2")
 theme_bw()

co2 %>%
  ggplot(aes(Teatment, update))+
  geom_boxplot()+
  geom_point(aes(size = conc,
                 colour = plant))+
  facet_wrap(~Type)+
  coord_flip()+
  theme_bw()+
  labs(title = "chilled vs Non-chilled")

view(mpg)

mpg %>%
  filter(cty < 25) %>%
  ggplot(aes(displ, cty))+
  geom_point(aes(colour = drv,
                 size = trans)
             alpha = 0.5)+
  geom_smooth()+
  facet_wrap(~year, nrown = 1)+
  labs(x = "Engine size",
       y = "MPG in the city",
       title = "Fule efficiency")+
  theme_bw()





  


