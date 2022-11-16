# Load Packages
library(ggplot2)
library(esquisse)
library(ggrepel)
library(ggpubr)

mutat
devtools::install_github("camdenk/mlbplotR")

#load data 
esquisse::esquisser(data= FantasyStandings, viewer = "browser")


# Points for 
PF <- ggplot(FantasyStandings) +
  aes(x = Wins, y = Points.For) +
  geom_text_repel(aes(label=Team)) +
  geom_point(shape = "circle", size = 2L) +
  scale_color_hue(direction = 1) +
  labs(
    x = "Wins",
    y = "Points For",
    title = "Fantasy League",
    subtitle = "Wins vs Points For ",
    color = "Team"
  ) +
  geom_smooth(method = "lm", se = FALSE) +
  theme_bw() +
  theme(
    plot.title = element_text(size = 14L,
                              face = "bold"),
    plot.subtitle = element_text(size = 10L,
                                 face = "italic")
  ) +
  xlim(0,9) +
  ylim(900, 1300) + 
  scale_x_continuous(breaks=c(0,1,2,3,4,5,6,7,8,9))



#points against 
PA <- ggplot(FantasyStandings) +
  aes(x = Wins, y = Points.Against) +
  geom_text_repel(aes(label=Team)) +
  geom_point(shape = "circle", size = 2L) +
  scale_color_hue(direction = 1) +
  labs(
    x = "Wins",
    y = "Points Against",
    title = "Fantasy League",
    subtitle = "Wins vs Points Against",
    color = "Team"
  ) +
  geom_smooth(method = "lm", se = FALSE) +
  theme_bw() +
  theme(
    plot.title = element_text(size = 14L,
                              face = "bold"),
    plot.subtitle = element_text(size = 10L,
                                 face = "italic")
  ) +
  xlim(0,9) +
  ylim(900, 1300) + 
  scale_x_continuous(breaks=c(0,1,2,3,4,5,6,7,8,9))


#Points Differential (PF-PA)
FantasyPointsDif <- FantasyStandings %>% mutate(Points.Differential = Points.For - Points.Against)


PD <- ggplot(FantasyPointsDif) +
  aes(x = Wins, y = Points.Differential) +
  geom_text_repel(aes(label=Team)) +
  geom_point(shape = "circle", size = 2L) +
  scale_color_hue(direction = 1) +
  labs(
    x = "Wins",
    y = "Points Differential",
    title = "Fantasy League",
    subtitle = "Wins vs Points Differential",
    color = "Team"
  ) +
  geom_smooth(method = "lm", se = FALSE) +
  theme_bw() +
  theme(
    plot.title = element_text(size = 14L,
                              face = "bold"),
    plot.subtitle = element_text(size = 10L,
                                 face = "italic")
  ) +
  xlim(0,9) +
  ylim(-200, 200) +
  scale_x_continuous(breaks=c(0,1,2,3,4,5,6,7,8,9)) + 
  scale_y_continuous(breaks=seq(-250,250, 50))

#one page 
ggarrange(PF, PA, PD) + rremove("x.text")






  
 
 



