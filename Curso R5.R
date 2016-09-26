gapminder <- read.csv("data/gapminder-FiveYearData.csv")

library("ggplot2")
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
geom_point()

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) #no le dije como quiero graficarlo, puntos o lineas

#ej 1
ggplot(data = gapminder, aes(x = year, y = lifeExp)) +
  geom_point()

#ej 2
ejercicio2 <- ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) +
  geom_point()

ggplot(data = gapminder,  aes(x = year, y = lifeExp, color = continent)) +
             geom_line() #si no le pongo by une por todos los paises dentro del continente por año... no tiene sentido NO SABE COMO AGRUPARLO
           
ggplot(data = gapminder, 
       aes(x = year, y = lifeExp, by = country, color = continent)) +
  geom_line()      
           
ggplot(data = gapminder, 
       aes(x = year, y = lifeExp,
           by = country, color = continent)) +
  geom_line() + geom_point()

ejercicio2 + geom_line(aes(by = country)) # si ya le guardamos un grafico, le podemos agregar otra capa

ggplot(data = gapminder, 
       aes(x = year, y = lifeExp, by = country)) +
  geom_line(aes(color = continent)) + geom_point()

ggplot(data = gapminder, 
       aes(x = year, y = lifeExp, by = country)) + geom_point() +
  geom_line(aes(color = continent))  

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10() # otra capa mas que cambiamos la escala, en este caso logaritmica el alfa agrega una tranparencia

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() + scale_x_log10() # el alfa hace que sean claros, y cuando se superponen muchos se ponen mas oscuros, sino son todos iguales y no se donde hay superposicion 

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5, color = "red") + scale_x_log10()


ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() + scale_x_log10() + geom_smooth(method = "lm") # agrega nuestra line de tendencia, lm es una lineal

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5, color = "red") + scale_x_log10() + geom_smooth() # si no le pongo metodo ajusta a regresiones local

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5, color = "red") + scale_x_log10() + geom_smooth() + geom_smooth(method = "lm" , color = "green") # si no le pongo metodo ajusta a regresiones local

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5, color = "red") +  geom_smooth() + geom_smooth(method = "lm" , color = "green") + coord_trans(x = "log10") # aca hace los calculos de la lineal antes de transformar los datos, por lo que le estoy indicando dos cosas a la vez

#ejercio 4

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, by = continent)) +
  geom_point(alpha = 0.5, color = "green", size = 3)  + scale_x_log10() + geom_smooth(method = "lm")

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent, by = continent)) +
  geom_point(alpha = 0.5)  + scale_x_log10() + geom_smooth(method = "lm")

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point(alpha = 0.5)  + scale_x_log10() + geom_smooth(method = "lm") # como pongo el color dentro de gplot, hace por defecto para todos, los puntos las lineas y lo que pongo

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5, aes( color = continent))  + scale_x_log10() + geom_smooth(method = "lm") # aca le pongo especificamente q ponga color solo en los puntos y entonces la linea es una sola 

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5, aes( color = continent, shape = continent))  + scale_x_log10() + geom_smooth(method = "lm", aes( color = continent)) # aca le pongo especificamente q ponga color  en los puntos y en la linea , esto es lo mnismo que ponerlo dentro de ggplo, si no tengo mas variables 

#figuras multipanel
starts.with <- substr(gapminder$country, start = 1, stop = 1) #como queremos la primer letra ponemos de la 1 a la 1, si queremos que tb chequee la segunda letra seria de 1 a 2 y chequea Af, Ar
az.countries <- gapminder[starts.with %in% c("A", "Z"), ] # solo los que empiezan con A o Z
ggplot(data = az.countries, 
       aes(x = year, y = lifeExp, color = continent)) +
  geom_point() + geom_line() + facet_wrap( ~country) # facet da un grafico por variable (pais) q ponemos. El aprox, es que aproxima por pais



starts.with <- substr(gapminder$country, start = 1, stop = 1)
starts.with

az.countries <- gapminder[starts.with %in% c("A", "Z"), ]
az.countries


p <- ggplot(mpg, aes(displ, cty)) + geom_point()
facet_grid



ggplot(data = az.countries, 
       aes(x = year, y = lifeExp, color = continent)) +
  geom_line() + 
  facet_wrap( ~country) +
  xlab("Year") +
  ylab("Life expectancy") + 
  ggtitle("Figura 1") +
  scale_colour_discrete( name = "Continent") +
  theme(strip.text = element_text(size = 13))

ggplot(data = az.countries, 
       aes(x = year, y = lifeExp, color = continent)) +
  geom_line() + 
  facet_wrap( ~country) +
  xlab("Year") +
  ylab("Life expectancy") + 
  ggtitle("Figura 1") +
  scale_colour_discrete( name = "Continent") +
  theme_bw()

ggplot(data = az.countries, aes(x = year, y = lifeExp, color = continent)) +
  geom_line() + 
  facet_wrap( ~country) +
  xlab("Year") +
  ylab("Life expectancy") + 
  ggtitle("Figura 1") +
  scale_colour_discrete( name = "Continent") +
 theme_classic(base_size = 15) +
  theme(strip.text = element_text(size = 16), axis.text.x = element_text(face = "italic")) + theme(axis.text.x = element_text(angle = 90, hjust = 1))


ggplot(data = az.countries, 
       aes(x = year, y = lifeExp, color = continent)) +
  geom_line() + 
  facet_wrap( ~ country) +
  xlab("Year") +
  ylab("Life expectancy") + 
  ggtitle("Figura 1") +
  scale_colour_manual( name = "Continent",
                       values =
                         c(Africa = "red",
                           Americas = "blue",
                           Asia = "yellow",
                           Oceania = "orange",
                           Europe = "purple"))+ 
  theme(axis.text.x=
          element_text(angle = 90, hjust = 1))



x <- 1:4
y <- 6:9
x + y

#ejercicio 1
gapminder
pop1  <- (gapminder$pop)/1000000
pop1

gapminder2 <- cbind(gapminder, pop1) 
gapminder2

str(gapminder2)

ggplot(data = gapminder, aes(x = year, y = pop1, color = continent )) +
  geom_point(alpha = 0.5)

ggplot(data = gapminder, aes(x = year, y = pop1)) +
  geom_point(alpha = 0.5) + 
  geom_text(data = subset(gapminder, country %in% c("China", "India")), aes(label = country, color = continent))



m <- matrix(1:12, nrow = 3, ncol = 4)
m

m ** -1
m * c(1,0,-1)
m > c(0, 20)
m
m * c(1,0,-1,2)

#ejercicio 2
v <- 1:100
v
v2 <- 1:10000
v2

sum( v ** -2)
sum(v2 ** -2)



gapminder <- read.csv("data/gapminder-FiveYearData.csv")
library(ggplot2)
ggplot(data = gapminder, 
       aes(x = year, y = pop, by = country)) +geom_point() +
  geom_text(data = 
              subset(gapminder, country %in% c("China", "India")) ,aes(label = country))


