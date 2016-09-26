dir.create("functions") #crea carpeta desde R

mi_suma <- function(a, b) {
  suma <- a + b
  return(suma)
}

mi_suma(5, 4)
mi_suma(a = 5, b = 4)

mi_suma <- function(a, b) {
  suma <- a + b
  suma # saco return entonces devuelve lo ultimo que asigne, q en este caso es suma
}

mi_suma(5, 4)

# una fc para convertir de kelvin a farengey
kelvin_a_fahr <- function(temp) {
  fahr <- (temp - 273.15) * (9/5) + 32
  return(fahr)
}
kelvin_a_fahr(273.15) 


# ej 1 funcion para pasar de celsius a kelvin
celsius_a_kelv <- function(temp) {
  kelv <- (temp + 273.15)
  return(kelv)
}
celsius_a_kelv(0) 


#ej 2 COMBINAR FUNCIONES: celsius a fahr llamo a las funciones ya creadas 
celsius_a_fahr <-function(temp) {
kelv <- celsius_a_kelv (temp) 
fahr <- kelvin_a_fahr (kelv)
return (fahr)
}

celsius_a_fahr(0)



gapminder <- read.csv("data/gapminder-FiveYearData.csv")
gapminder

# Toma el set de datos y multiplica la columna 
# población por PBI per capita
calcPBI <- function(dat) {
  pbi <- dat$pop * dat$gdpPercap
  pbi
}
calcPBI(head(gapminder))
 


calcPBI <- function(dat, year = NULL, country = NULL) {
if(!is.null(year)){ # con el signo de admiracion le digo que haga lo contrario
  dat <- dat[dat$year %in% year, ]# si no es nulo selecciona las filas q estan dentro del año q elegi
}
if(!is.null(country)){
  dat <- dat[dat$country %in% country, ]
}
pbi <- dat$pop * dat$gdpPercap
new <- cbind(dat, pbi = pbi)
return(new)
}

calcPBI(head(gapminder))
calcPBI(gapminder, year = 2007)
calcPBI(gapminder, country = "Argentina")
calcPBI(gapminder, year = 2002, country = "Argentina")

head(gapminder)

list (gapminder$country)

#ej 3
 calcPBI(gapminder, year = c(1987, 1952), country = "New Zealand")


 diff( calcPBI(gapminder, year = c(1987, 1952), country = "New Zealand")$pbi)# hace la dif solo de la columna pbi
 

 # ej4
 mejores_practicas <- c("Escribe", "programas", "para", "personas", 
                        "no", "para", "computadoras")
 paste(mejores_practicas, collapse = " ") # colapsa vector en uno solo

 mejores_practicas <- c("Escribe", "programas", "para", "personas", 
                        "no", "para", "computadoras")
 paste(mejores_practicas, collapse = "-") # colapsa vector en uno solo, como ponemos guines, nos separa cada elemento conguiones
 



mejores_practicas <- c("Escribe", "programas", "para", "personas", 
                       "no", "para", "computadoras")
paste(mejores_practicas, collapse = " ") 



#ej 4

#las siguientes dos lineas es como se tiene que PENSAR para hacer la fc
paste(mejores_practicas, collapse = " ")
paste("***",paste(mejores_practicas, collapse = " "),"***" )


# ahora ya se como quiero q aparezca, entonces creo la fc, q la voy a llamar vallar

vallar <- function(texto, envoltura){
  paste0(envoltura, paste(texto, collapse = " "), envoltura) #paste0 no deja espacios entre los argumentos
}

vallar(texto = mejores_practicas, envoltura = "***") #una fc es una generalizaciond e algo q ya escribimos. Aca le defino que es el texto y que la envoltura

vallar(mejores_practicas, "***") # esto es lo mismo que arriba, como ya defini en la fc como es el orden dentro de la fc no hace falta definirlo


# en limpio

vallar <- function(texto, envoltura){
  paste0(envoltura, paste(texto, collapse = " "), envoltura) 
  }
vallar(mejores_practicas,"***")



library(ggplot2)
gapminder <- read.csv("data/gapminder-FiveYearData.csv")

ggplot(data=gapminder, aes(x=year, y=lifeExp,colour=country)) + geom_line() + face_grid(continent-.)

  pdf("Mi_grafico.pdf", width = 12, height = 8, onefile = TRUE)
  for (continent in levels(gapminder$continent)) {
  print (ggplot(data = gapminder[gapminder$continent == continent, ], aes(x=year, y=lifeExp, colour= country)) +
          geom_line())
  }
        dev.off()    
       
 
    pdf("Mi_grafico.pdf", width = 12, height = 8, onefile = TRUE)
    for(continent in levels(gapminder$continent)){
      print(ggplot(data = gapminder[gapminder$continent == continent, ], aes(x=year, y=lifeExp, colour=country)) +
              geom_line())
    }
    dev.off() 
    
     
    
    pdf("Life_Exp_vs_time.pdf", width=12, height=12, onefile = TRUE)
    ggplot(data=gapminder, aes(x=year, y=lifeExp, colour=country)) +
      geom_line() +
      theme(legend.position = "bottom")
    
    
    dev.off()
    
    pdf("Life_Exp_vs_time.pdf", width=12, height=12, onefile = TRUE)
    ggplot(data=gapminder, aes(x=year, y=lifeExp, colour=country)) +
      geom_line() + facet_grid(continent ~ .) + #facet grid hace paneles distintos
      theme(legend.position = "bottom")
    
    
    dev.off()
    