#load packages and data
library(ggplot2)
data(diamonds)

esquisse::esquisser(data=diamonds, viewer = "browser")


# use package ggplot to create 
ggplot(diamonds) +
  aes(x = carat, y = price) +
  geom_point(shape = "circle", size = 1.5, colour = "#112446") +
  theme_minimal()

# model2

# use ggplot package to create a data visualization
ggplot(diamonds) +
  aes(x = carat, y = price) +
  geom_point(
    # define shape and size of points 
    shape = "diamond",
    #shrink size
    size = 1.25,
    #change color to diamond like
    colour = "#669AC6"
  ) +
  labs(
    # add labels and title
    x = "Carat Size",
    y = "Price",
    title = "Price Vs Carat Size"
  ) +
  theme_minimal()


