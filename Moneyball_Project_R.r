batting <- read.csv('Batting.csv')

head(batting)

str(batting)

head(batting$AB)

head(batting$X2B)

batting$BA <- batting$H / batting$AB

tail(batting$BA,5)

batting$OBP <- (batting$H + batting$BB + batting$HBP)/(batting$AB + batting$BB + batting$HBP + batting$SF)

batting$X1B <- batting$H - batting$X2B - batting$X3B - batting$HR

batting$SLG <- ((1*batting$X1B) + (2*batting$X2B) + (3*batting$X3B) + (4*batting$HR)) / batting$AB

str(batting)

summary(batting)

batting <- subset(batting, yearID>=1985)

summary(batting)

sal <- read.csv('Salaries.csv')

summary(sal)

combo <- merge(batting,sal,by=c('playerID','yearID'))

summary(combo)

lost_players <- subset(combo, playerID %in% c('giambja01', 'damonjo01','saenzol01'))

lost_players <- subset(lost_players, yearID==2001)

lost_players <- lost_players[,c('playerID', 'H', 'X2B', 'X3B', 'HR', 'OBP', 'SLG', 'BA', 'AB')]
lost_players

combo <- subset(combo, yearID==2001)
str(combo)

library(ggplot2)
library(dplyr)

ggplot(combo, aes(x=OBP, y=salary)) + geom_point()

combo <- subset(combo, salary < 8000000 & OBP > 0)
str(combo)

combo <- subset(combo, AB>=500)

targets <- head(arrange(combo, desc(OBP)),10)

targets <- targets[,c('playerID','OBP','AB','salary')]
targets

print(targets[2:6,])


