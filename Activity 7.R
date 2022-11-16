## Activity 7

df <- read.table(file = 'rawarmydata.csv')

library(janitor)
library(dplyr)

#Filter only paygrade to E-7
ArmyTable <- rawArmyData %>% filter(payGrade == "E-7")

# create relfreq table
ArmyRelTable <- ArmyTable %>%
  tabyl(sex, maritalStatus) %>%
  adorn_totals(where = c("row", "col") ) %>%
  adorn_percentages(denominator = "all") %>%
  adorn_pct_formatting(digits = 2) %>%
  adorn_title(
    placement = "combined",
    row_name = "Sex",
    col_name = "MaritalStatus") 

#creates absfreq table
ArmyAbsTable <- attr(ArmyRelTable, "core") %>%
  adorn_totals(where = c("row", "col")) %>%
  mutate(
    across(where(is.numeric), format, big.mark = ",")
  )

#creates freq table w both abs and rel data
ArmyFreqTable <- ArmyRelTable %>%
  adorn_ns(position = "front", ns = ArmyAbsTable)


# polish data 
ArmyFreqTable %>%
  kable(
    caption = "Sex and Marital Status in Paygrade E-7",
    booktabs = TRUE,
    align = c("l", rep("c", 6))
  ) %>%
  kableExtra::kable_styling(
    bootstrap_options = c("striped", "condensed"),
    font_size = 16
  )

#2 Diamonds Data 

#load packages and data
library(janitor)
library(dplyr)
library(kableExtra)
data(diamonds)

#make summary table 
diamondsummary_y <- diamonds %>%
  group_by(cut) %>%
  select(cut, y ) %>%
  summarize(
    across(
      .cols = where(is.numeric),
      .fns = list(
        min = ~min(.x, na.rm = TRUE),
        Q1 = ~quantile(.x, probs = 0.2, na.rm = TRUE),
        Q2 = ~quantile(.x, probs = 0.4, na.rm = TRUE),
        median = ~median(.x, na.rm = TRUE),
        Q3 = ~quantile(.x, probs = 0.6, na.rm = TRUE),
        Q4 = ~quantile(.x, probs = 0.8, na.rm = TRUE),
        max = ~max(.x, na.rm = TRUE),
        mean = ~mean(.x, na.rm = TRUE),
        sasd = ~sd(.x, na.rm = TRUE)
      )
    ),
    count = format(n(), big.mark = ','),
  )

colnames(diamondsummary_y) <- c('Cut','min','Q1','Q2','Median','Q3','Q4','Max','Arithmetic Mean','Arithmetic Standard Deviation','count')

#polish
diamondsummary_y %>%
  kable(
    caption = "Diamonds Cut Summary For width",
    booktabs = TRUE,
    align = c("l", rep("c", 6)),
    digits = 2
  ) %>%
  kableExtra::kable_styling(
    bootstrap_options = c("striped", "condensed"),
    font_size = 16
  )




