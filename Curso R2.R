list(1, "a", TRUE, 1 + 4i)
data.frame (1, "a", TRUE, 1 + 4i)
another_list <- list(title = "Research Bazaar", numbers = 1:10, data = TRUE )
another_list
as.data.frame(another_list)
otra_lista <- list(titulo= c ("Biologia", "zoo", "bot"), numeros = 1:10, data = TRUE))
gatos<- read.csv("data/datos-felinos.csv")
typeof(gatos)
class(gatos)
as.list (gatos)
typeof (gatos$pelaje)
typeof (gatos)  
gatos [1] # corchetes selecciona algo de nuestro vector. en este caso 1 nos da toda nuestra primer columna, si pongo tres nos da gusto ovillo. con un corchete siempree devuelve una lñista
typeof (gatos [1])
gatos[[1]]
typeof (gatos[[1]])# con doble corchete nos devuelve el vector directamente. devuelve lista
gatos$pelaje
typeof (gatos$pelaje)# con $ nos devuelve el vector directamente
gatos["pelaje"]
typeof (gatos["pelaje"]) #devuelve lista
gatos[1, 1]
typeof (gatos[1, 1]) # da var uno col uno. devuelve vector (siempre que tenga dos numeros con coma)
gatos[, 1]
typeof (gatos[, 1]) # seleccionar todas las filas de la col 1
gatos[1, ]
typeof (gatos[1, ])# seleccionar todas las filas de la col 1
gatos[, ]
typeof (gatos[ , ])# seleccionar todo 
pelaje[[1]] [2]


matrix_example <- matrix(0, ncol = 6, nrow = 3) # primer numero, on q llenar
matrix_example

matrix_example <- matrix(1:50, ncol = 5, nrow = 10)
matrix_example

matrix_example <- matrix(seq (1,50), ncol = 5, nrow = 10)
matrix_example
x <- 1:50
matrix (x, 10,5) #es lo mismo en forma anidada

matrix_example <- matrix(1:50, ncol = 5, nrow = 10, byrow = TRUE)
matrix_example

ej6
dput(ej6)  

ej6 <- list(data_types = c("integer", " double", "logical", "complex", "character"), data_structures = c("vector", "matrix", "list", "data.frame"))
ej6      

#ej7
matrix(c(4, 1, 9, 5, 10, 7), nrow = 3)
matrix(c(4, 9, 10, 1, 5, 7), ncol = 2, byrow = TRUE)
matrix(c(4, 9, 10, 1, 5, 7), nrow = 2)
matrix(c(4, 1, 9, 5, 10, 7), ncol = 2, byrow = TRUE)

read.csv("data/datos-felinos.csv")

levels(gatos$pelaje)#devuelve niveles del factor
  
levels(gatos$pelaje) <- c(levels(gatos$pelaje), "carey") #agregamos nuevo nivel del factor pelaje
levels(gatos$pelaje)
nuevaFila <- list("carey",3.3, TRUE, 9)
gatos <- rbind(gatos, nuevaFila)
gatos$edad <- c(4,5,8,9)
gatos

rm(T)
gatos[,1]
gatos [-5:-12,]
gatos2
gatos
gatos
gatos[-(5:12),]
gatos
gatos <- gatos[-(5:12),]
gatos
levels(gatos$pelaje) <- c(levels(gatos$pelaje), "pelado")
levels(gatos$pelaje)
gatos
nuevaFila <- list("pelado",3.3, TRUE, 9)
gatos
gatos$edad <- c(4,5,8,9)df

gapminder2
df <- rbind(df, nuevaFila2)
df
nuevaFila2 <- list("gabriela","gonzalez", 10)
df
df [-2,]
df
df <- df[-2,]
df

recreo <- c("si","si")
df <- cbind(df, recreo)
df


gapminder <- read.csv("data/gapminder-FiveYearData.csv")
gapminder

gapminder2 <- read.delim("data/gapminder-FiveYearData.csv")
gapminder2

gapminder3 <- read.csv("https://swcarpentry.github.io/r-novice-gapminder/data/gapminder-FiveYearData.csv")
gapminder3

gapminder
str(gapminder)
install.packages("readxl")
update.packages("readxl")
?readxl
library (readxl)

str(gapminder)
typeof(gapminder$country)
typeof(gapminder$year)

length(gapminder)
nrow(gapminder)
colnames(gapminder)

names(gapminder) <- c("pais", "anio", "pop", "continente", "expvida", "pbipercap")
head(gapminder)

as.integer(gapminder$pop)
typeof (gapminder$pop)
