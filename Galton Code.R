# Plan
## Data set
## Laod packages ( ggplot2, esquisse)
## Aim: rank of heights by family role
## geometry: box plot
## Mapping: family group, heights

# code 
galton

library(ggplot2)
library(esquisse)

esquisse::esquisser(data=Galton_MIX_Sheet1, viewer = "browser")


ggplot(
  data = Galton_MIX_Sheet1,
  mapping = aes(x = Member, y = Height_in) 
)+
  geom_boxplot(fill = "#112446") +
  theme_minimal() +
    ylab("Height in")

