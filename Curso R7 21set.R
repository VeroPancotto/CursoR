library(plyr)

gapminder <- read.csv("data/gapminder-FiveYearData.csv")
gapminder


calcPBI <- function(dat, year = NULL, country = NULL) {
  if (!is.null(year)){ # con el signo de admiracion le digo que haga lo contrario
    dat <- dat[dat$year %in% year, ]# si no es nulo selecciona las filas q estan dentro del año q elegi
  }
  if (!is.null(country)){
    dat <- dat[dat$country %in% country, ]
  }
  pbi <- dat$pop * dat$gdpPercap
  new <- cbind(dat, pbi = pbi)
  return(new)
}

conPBI <- calcPBI(gapminder)
ddply(
  .data = calcPBI(gapminder),# entra ys ale un dataframe
  .variables = "continent", #divido x continent
  .fun = function(dat) mean(dat$pbi) ) #creo una fc anonima, que no mnos interesa guardar, entonces cada division o cada cachito (por continente) lo pasa como dat


conPBI <- calcPBI(gapminder)# esto no es lo que querem os, solo para mostrar l q hace
dlply(
  .data = calcPBI(gapminder),# entra ys ale un dataframe
  .variables = "continent", #divido x continent
  .fun = head ) #devuelve 6 columnas por poner haed esto es para ver como va dividiendo


conPBI <- calcPBI(gapminder)
dlply(
  .data = calcPBI(gapminder),# entra data frame, devuelve una lista
  .variables = "continent", #divido x continent
  .fun = function(dat) mean(dat$pbi) )


conPBI <- calcPBI(gapminder)
daply(
  .data = calcPBI(gapminder),# entra data frame, devuelve una vector
  .variables = "continent", #divido x continent
  .fun = function(dat) mean(dat$pbi) )


conPBI <- calcPBI(gapminder)
ddply(
  .data = calcPBI(gapminder),# entra ys ale un dataframe
  .variables = c("continent", "year"), #divido x continent
  .fun = function(dat) mean(dat$pbi) ) #creo una fc anonima, que no mnos interesa guardar


conPBI <- calcPBI(gapminder)
daply(
  .data = calcPBI(gapminder),# entra dataframe y sale un vector  
  .variables = c("continent", "year"), #divido x continent
  .fun = function(dat) mean(dat$pbi) ) 


d_ply(
  .data = gapminder,
  .variables = "continent",
  .fun = function(x) {
    meanGDPperCap <- mean(x$gdpPercap)
    print(paste(
      "The mean GDP per capita for", unique(x$continent),
      "is", format(meanGDPperCap, big.mark = ",")
    ))
  }
)


medias_continente <- ddply(
  .data = gapminder,
  .variables = "continent",
  .fun = function(x) {
    meanGDPperCap <- mean(x$gdpPercap)
    print(paste(
      "The mean GDP per capita for", unique(x$continent),
      "is", format(meanGDPperCap, big.mark = ",")
    ))
  }
)

format(1.003, decimal.mark = ",")


#creamos una funcion q el decimal lo ponga con ,(coma)
conComa <- function(x, ...){
  format(x, decimal.mark = ",",...)#los tres puntos (elipse) significa q cualquier lista (argumento) le asigna la fc
}
conComa(1.003)


medias_continente <- ddply(
  .data = gapminder,
  .variables = "continent",
  .fun = function(x) {
    meanGDPperCap <- mean(x$gdpPercap)
    print(paste(
      "The mean GDP per capita for", unique(x$continent),
      "is", conComa(meanGDPperCap, big.mark = ".")
    ))
  }
)


puntos <- function(...){
  dots <- list(...)
  print(dots)
}

puntos(big.mark = ".", a ="2", small = TRUE)

#ejercicio1

ddply(
  .data = gapminder, 
  .variables = "continent", #divido x continent
  .fun = function(dat) mean(dat$lifeExp))


lifeExp_continent <- ddply(gapminder, .(continent), function (x) mean(x$lifeExp))
max(lifeExp_continent$V1)

  lifeExp_continent[c(which.max(lifeExp_continent$V1),which.min(lifeExp_continent$V1)), ]
  

#ejercicio 2
  
  lifeExp_continent_year <- ddply(gapminder, .(continent, year), function(x) mean(x$lifeExp))
  
   lifeExp_continent_2007 <-
  lifeExp_continent_year[lifeExp_continent_year$year == 2007, ]
 
   lifeExp_continent_1952 <-
     lifeExp_continent_year[lifeExp_continent_year$year == 1952, ]

       lifeExp_continent_1952 
 lifeExp_continent_2007 
 lifeExp_continent_1952_2007 <-
 cbind(lifeExp_continent_1952, anio_2007 = lifeExp_continent_2007$V1)
 lifeExp_continent_1952_2007
 names(lifeExp_continent_1952_2007)[3]  <- "anio_1952"
 lifeExp_continent_1952_2007$diferencia <- with(lifeExp_continent_1952_2007, anio_2007 - anio_1952)
 
 lifeExp_continent_1952_2007$diferencia 
 
 #ejercicio avanzado
 lifeExp_continent_year
 ddply(lifeExp_continent_year, .(continent),
       function(x) x [x$year == 2007, "V1"] - x[x$year == 1952, "V1"])
 
 #para calcular media y desvio st
 ddply(gapminder, .(continent), summarise, media_lifeExp = mean(lifeExp),
       sd_lifeExp = sd(lifeExp))
 
 
 # nueva presentacion de dplyr
 install.packages('dplyr')
   
 library(dplyr)
 
 
 year_country_gdp <- select(gapminder,year,country,gdpPercap)
 # LOS PIPES ENVIAN LA SALIDA DE UNA FC A OTRA FUNCION, ES MAS CLARO QUE ANIDAR FUNCIONES!! POR DEFECTO ES COMO PRIMER argumento de la primera fc
 
 
 year_country_gdp_euro <- gapminder %>%
   filter(continent == "Europe") %>%
   select(year, country, gdpPercap)
 
 lifeE_country_year_africa <- gapminder %>%
   filter(continent == "Africa") %>%
   select(lifeExp, country, year)
 
 str(gapminder %>% group_by(continent, year))
 
 
lifeExpcountry <- gapminder %>%
   group_by(country) %>%
   summarize(mean_lifeExp = mean(lifeExp))
lifeExpcountry[c(which.max(lifeExpcountry$mean_lifeExp),which.min(lifeExpcountry$mean_lifeExp)), ]

#otra forma de lo mismo mas simple
lifeExpcountry %>% filter(mean_lifeExp %in% range(mean_lifeExp))


 gapminder %>%
 filter (year == 2002) %>%
  group_by (continent)%>%
  sample_n(2)%>%
  summarize(mean_lifeExp= mean(lifeExp))%>%
  arrange(desc(mean_lifeExp))
