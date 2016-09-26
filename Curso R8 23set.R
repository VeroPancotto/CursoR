install.packages("tidyr")
install.packages("dplyr")
library("tidyr")
library("dplyr")
library("plyr")
gapminder <- read.csv("data/gapminder-FiveYearData.csv")
gapminder
str(gapminder)

library("ggplot2")
install.packages("GGally")
library("GGally")
ggpairs(gapminder,
        columns = c(3, 5,6),
        colour = "continent")

gap_wide <- read.csv("http://bit.ly/gap_wide", stringsAsFactors = FALSE) #cargo atos para transformar dataframe de formato ancho a largo

gap_wide <- read.csv("data/gapminder_wide.csv", stringsAsFactors = FALSE) #carque este formato aANCHOde la web
str(gap_wide)
View(gap_wide)

gap_long <- gap_wide %>%
  gather(obstype_year,obs_values, starts_with('pop'),
         starts_with('lifeExp'), starts_with('gdpPercap')) #start with busca las columnas q comienzcen con ese nombre y crea 
str(gap_long)

gap_long <- gap_wide %>% gather(obstype_year,obs_values,-continent,-country) #con el menos saca las columnas q va a usar como identificatorias, para estar seguros que no las toma como observaciones
str(gap_long) #esto es lo mismo q lo anterior

gap_long <- gap_long %>% 
  separate(obstype_year, #nos separa las columnas, entonces me va a dividir en columnas a partir de lo que tenga un guion bajo. 
            into = c('obs_type','year'), sep = "_") #Pero va a quedar como caracter entonces lo paso a un valor entero
gap_long$year <- as.integer(gap_long$year)


str(gapminder)
unique(gap_long$obs_type)

#ejercicio 2
mean_xcontinent <- gap_long %>%
    group_by (continent, obs_type) %>%
    summarize(media = mean(obs_values))
options(scipen = 99) # le digo en que formato me presente los datos, si cientificos o con numero de decimales

# si quiero hacer un anova
gap_aov <- gap_long %>%
  group_by( obs_type) %>%
  do(aov = aov(obs_values ~ continent, data = .))

#otra forma de agrupar los datos para hacer el anova
gap_aov_ply <- dlply(gap_long, .(obs_type), function(x) #divido por el tio de observacopn
  aov(obs_values ~ continent, data =x))

gap_aov_ply <- dlply(gap_long, .(obs_type), function(x) 
  aov(obs_values ~ continent + year, data =x)) #toma solo continente y año (sin interaccion MODELO ADITIVO)

gap_aov_ply <- dlply(gap_long, .(obs_type), function(x) #divido por el tio de observacopn
  aov(obs_values ~ continent * year, data =x)) #toma a continene año  y interaccion


gap_normal <- gap_long %>% spread(obs_type, obs_values)
dim(gap_normal)

names(gap_normal)
names(gapminder) #queda en distinto orden


gap_normal <- gap_normal[,names(gapminder)] #ordeno a las columnas como en gapmindeer
all.equal(gap_normal,gapminder)

gap_normal <- gap_normal %>% arrange(country,continent,year) #ordeno por pais., luego continente y luego por año
all.equal(gap_normal,gapminder)

# para llevar al formato ancho
#entonces primero tenemo que unir los años con unite

gap_temp <- gap_long %>% 
  unite(var_ID, continent, country, sep = "_") #creo una nueva col que une a cintinente y pais



El original estaba ordenado por country, continent, luego year.

gap_normal <- gap_normal %>% arrange(country,continent,year)
all.equal(gap_normal,gapminder)

[1] TRUE

Ahora convirtamos desde largo hasta ancho.

Vamos a conservar las variables identificatorias y extender todas las observaciones de las tres medidas (pop,lifeExp,gdpPercap) y tiempo (year).

Primero necesitamos crear las etiquetas apropiadas para nuestras nuevas variables (tiempo*medida) y también unificar nuestras variables identificatorias pas simplificar el proceso:
  
  gap_temp <- gap_long %>% 
  unite(var_ID, continent, country, sep = "_")

str(gap_temp)
#ahora uno la typo de obs y año



#Ahora convirtamos desde largo hasta ancho.

#Vamos a conservar las variables identificatorias y extender todas las observaciones de las tres medidas (pop,lifeExp,gdpPercap) y tiempo (year).

#Primero necesitamos crear las etiquetas apropiadas para nuestras nuevas variables (tiempo*medida) y también unificar nuestras variables identificatorias pas simplificar el proceso:
  
  gap_temp <- gap_long %>% 
  unite(var_ID, continent, country, sep = "_")

str(gap_temp)

gap_temp <- gap_long %>%
  unite(ID_var,continent,country,sep = "_") %>%
  unite(var_names, obs_type, year, sep = "_")
str(gap_temp)


gap_wide_new <- gap_long %>%
  unite(ID_var, continent, country, sep = "_") %>%
  unite(var_names, obs_type, year, sep = "_") %>%
  spread(var_names, obs_values)
str(gap_wide_new)

#ejercicio 3
gap_ridiculamente_ancho <- gap_long %>%
  unite(var_names, country, year, obs_type, sep = "_") %>%
    spread(var_names, obs_values)
str(gap_ridiculamente_ancho)
dim(gap_ridiculamente_ancho)



gap_wide_betterID <- separate(gap_wide_new, ID_var, 
                              c("continent","country"), sep = "_")
gap_wide_betterID <- gap_long %>%
  unite(ID_var, continent, country, sep = "_") %>%
  unite(var_names, obs_type, year, sep = "_") %>%
  spread(var_names, obs_values) %>%
  separate(ID_var, c("continent", "country"), sep = "_")

str(gap_wide_betterID)
all.equal(gap_wide, gap_wide_betterID)


install.packages(c("jsonlite", "base64enc"))
