vignette(package = "ggplot2")
??"plot"
dput(InsectSprays)
?c
c(1, 2, 3)
c('d', 'e', 'f') # letras tienen q ir entre comillas
c(1, 2, 'f')
?paste (sep)
??sep
?collapse
paste(1:12)
paste("hola", c("Juan", "Ailen"), sep= " , ")

paste("hola", c("Juan", "Ailen"), sep= " , ", collapse = " . ")
??csv
?read.csv
read.csv("data/gapminder-FiveYearData.csv")
read.csv(file= "data/gapminder-FiveYearData.csv")
read.csv("data/gapminder-FiveYearData.csv", "FALSE")

read.table("data/datos-felinos.csv")
read.csv("data/datos-felinos.csv")
gatos <-read.csv("data/datos-felinos.csv")
gatos$pelaje
gatos$peso + 1
gatos$peso / 2
paste("mi gato es ", gatos$pelaje)
typeof((gatos$pelaje))
gatos2 <-read.csv("data/datos-felinos-v2.csv")
gatos2
typeof((gatos2$peso))
class(gatos2)
class(gatos)
mi_vector <- vector(length = 3) #creo un vector q es una lista del mismo tipo, caracteres, logicos (x defecto), etc
mi_vector
str(gatos)
> edad <- c(2, 3, 5)
> edad
[1] 2 3 5
> gatos
pelaje peso gusta_ovillo
1 atigrado  2.1            1
2    negro  5.0            0
3  bicolor  3.2            1
> cbind (gatos, edad)
pelaje peso gusta_ovillo edad
1 atigrado  2.1            1    2
2    negro  5.0            0    3
3  bicolor  3.2            1    5
gatos <- (cbind gatos, edad)
Error: unexpected symbol in "gatos <- (cbind gatos"
gatos <- cbind (gatos, edad)
gatos
nuevaFila <- list("carey",3.3, TRUE, 9) # creo la nueva fila con list, list permite poner todo tipo de datos
rbind(gatos,nuevaFila)
levels(gatos$pelaje)
levels(gatos$pelaje) <- c(levels(gatos$pelaje), "carey")
levels(gatos$pelaje)
rbind(gatos,nuevaFila)

# coersion..par ver los datos como queremos
character_verctor <- c("0", "2", "3")
character_verctor + 1
as.numeric(character_verctor) + 1
mi_factor <- as.factor(c("a", "b"))
mi_factor
as.numeric(mi_factor)
mi_character <- as.factor(c("a", "b"))
mi_character_como_numeric <- as.numeric(mi_character)
mi_character

seq(1,10, 0.1)
seq(1,100, 0.1)

#ejercicio 1
mySeries <- 1:26
mySeries
mySeries * 2
n <- mySeries * 2
n
seq("A", "Z")

names_example <- n
names(names_example) <- c(LETTERS)
names_example

# otra forma
m <- seq (1:26) * 2
m
names_example <- m
names(names_example) <- c(LETTERS)
names_example


pelajes <- c('atigrado', 'carey', 'carey', 'negro', 'atigrado')
pelajes

str(pelajes)


# ejercicio 2
?read.csv
default.stringsAsFactors()
gatos <- read.csv(file = "data/datos-felinos.csv", stringsAsFactors = FALSE)
typeof(gatos$pelaje)
str(gatos)


gatos <- read.csv(file = "data/datos-felinos.csv", as.is = TRUE)
typeof(gatos$pelaje)
str(gatos)


gatos <- read.csv(file = "data/datos-felinos.csv")
gatos$pelaje
gatos
