library('dplyr')
library('readr')
csv <- read_csv("C:/Users/LENOVO/Downloads/ENFData.csv") ##will need to change to your location

table <- data.frame();

States <- c("NSW","VIC","QLD","WA","SA","TAS","NT","ACT","NZ")

Rural_weight = 1.5##Weighting is 1+n

for(i in 1:nrow(csv)){
  state <- csv$State[i]
  dels <- csv$Dels[i]+csv$Rural[i]*Rural_weight ##weighting formula
  for(j in 1:3){
    val <- dels/j
    row <- data.frame("State"=state,"Rank"=val)
    table <- rbind(table,row)
  }
}

rank <- table %>% arrange(desc(Rank))

entries <- data.frame(Entry = c(States,States,rank$State[1:12]))

entries <- entries %>% count(Entry)

entries <- entries %>% arrange(desc(n),Entry)
entries
