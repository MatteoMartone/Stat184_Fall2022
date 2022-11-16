library(palmerpenguins)
data(penguins)

esquisse::esquisser(data=penguins, viewer = "browser")

ggplot(penguins) +
  aes(x = species, weight = bill_length_mm) +
  geom_bar(fill = "#112446") +
  theme_minimal() +
  facet_grid(vars(), vars(island))



# model2 
ggplot(penguins) +
  #added variable sex
  aes(x = species, fill = sex, weight = bill_length_mm) +
  geom_bar() +
  scale_fill_manual(
  # color coordinated sex
    values = c(female = "#FFA8F6",
               male = "#759AF1")
  ) +
  # fixed labeling
  labs(
    x = "Penguin Species",
    y = "Bill Length MM",
    title = "Bill length of Penguin Species",
    subtitle = "Island"
    #theme change and more boxes 
  ) +
  theme_light() +
  theme(
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(size = 12L,
                                 hjust = 0.5),
    axis.title.y = element_text(size = 12L),
    axis.title.x = element_text(size = 12L)
  ) +
  facet_grid(vars(sex), vars(island))