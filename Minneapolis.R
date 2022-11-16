library(dcData)
data("Minneapolis2013")
View(Minneapolis2013)

nrow(Minneapolis2013)

Minneapolis2013 %>%
  group_by(Second) %>%
  summarise(voteReceived = n())%>%
  arrange (desc(voteReceived))

Minneapolis2013 %>%
  summarise(sum(First == 'undervote'),
            sum(Second == 'undervote'),
            sum(Third == 'undervote'))

Minneapolis2013 %>%
  group_by(First, Second) %>%
  summarise(voteReceived = n())%>%
  arrange (desc(voteReceived))

Minneapolis2013 %>%
  group_by(Precinct)%>%
  summarise(count=n())%>%
  arrange (desc(count))

