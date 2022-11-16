library(ggplot2)
library(tidyverse)

data("BabyNames")

selected_names <- BabyNames %>% filter(name %in% c('Alyssa','Emma','Stacy','Karen','Alia'), sex == "F")


selected_names%>%
ggplot(aes(x = year, y = count, group = name)) +
  geom_line( size = 1, alpha = 0.5, aes(color = name)) +
  labs(
    x = "Year",
    y = "Popularity",
    title = "My Family's Name popularity"
    )+
  xlim(1880,2020)
  
