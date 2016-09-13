gapminder <- read.csv("data/gapminder-FiveYearData.csv")
gapminder
str(gapminder)# va sin comillas por e es un objeto, ya lo llamamos antes
dim(gapminder)
colnames(gapminder)
levels(gapminder$country)
levels(gapminder$continent)
head(gapminder)
#todo esto es lo basico de como hacer un archivo reproducible. para comenzar a analizar
