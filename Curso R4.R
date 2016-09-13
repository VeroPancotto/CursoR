set.seed(10)
x <- rpois(1, lambda = 8)
if (x >= 10) {    print("x es más grande o igual que 10") 
}else if (x > 5) { print("x es mayor que 5")
}else {print("x es mayor que 5")  }

gapminder <- read.csv("data/gapminder-FiveYearData.csv")
gapminder
str(gapminder)

if (any(gapminder$year == 2002)) {
print("hay datos 2002")
} else if (any(gapminder$year == 2012))## solo chequea el primero y pasa al degundo si es falso
  print("hay datos 2012")
  
if (any(gapminder$year == 2012)) {
print("hay datos 2012")
} else print("no hay datos 2012")
  
for(i in 1:10) {
  print(i)
}

for(i in seq(1, 10, by = 2)) {
  print(i)
}

for (i in c("a", "b", "c")) {
  print(i)
}

for(i in seq(from = 1, to = 10, length.out = 20)) {
  print(i)
}

for( i in 1:5) {
  for (j in c("a", "b", "c", "d", "e")) {
print(paste(i, j))
  }
}

vector_salida <- c()
for (i in 1:5) {
  for (j in c('a', 'b', 'c', 'd', 'e')) {
    salida_temporal <- paste(i, j)
    vector_salida <- c(vector_salida, salida_temporal)
  }
}
vector_salida

matrix_salida <- matrix(nrow = 5, ncol = 5)
vector_j <- c('a', 'b', 'c', 'd', 'e')
for (i in 1:5) {
  for (j in 1:5) {
    valor_j_temp <- vector_j[j]
    salida_temp <- paste(i, valor_j_temp)
      matrix_salida [i, j] <- salida_temp
        }
}

matrix_salida
vector_salida2 <- as.vector(matrix_salida)

vector_salida2

z <- 1
while (z > 0.1){
  z <- runif(1)
  print(z)
}

vector_salida == vector_salida2


matrix_salida <- matrix(nrow = 5, ncol = 5)
vector_j <- c('a', 'b', 'c', 'd', 'e')
for (i in 1:5) {
  for (j in 1:5) {
    valor_j_temp <- vector_j[j]
    salida_temp <- paste(i, valor_j_temp)
    matrix_salida [j, i] <- salida_temp
  }
}

matrix_salida
vector_salida3 <- as.vector(matrix_salida)
vector_salida3

vector_salida == vector_salida3


vector_salida %in% vector_salida2 # comprueba que todos los elementos estan en uno y otro vector

t (matrix_salida)

#ejercio 2

gapminder <- read.csv("data/gapminder-FiveYearData.csv")
gapminder
str(gapminder)
gapminder[gapminder$continent == "Asia", ]

media1 <-mean(gapminder[gapminder$continent == "Asia", "lifeExp"])
media <-mean(gapminder$lifeExp[gapminder$continent == "Asia" ])

if(media > 50) {
  print ("la media de asia de vida es mayor a 50")
}
else {
  " la media de vida es menor a 50"
}

continentes <- levels(gapminder$continent)
for(continente in continentes) {
  media <- mean(gapminder$lifeExp[gapminder$continent == continente])
  if (media > 70){
    print(paste("en", continente, "la media de vida es mayor a 70"))
  } else {
    print(paste("en", continente, "la media de vida es menor a 70"))
  }
}

for(continente in continentes){
  print(continente)
}

paises <- levels(gapminder$country)
for (pais in paises) { 
  media <- mean(gapminder$lifeExp[gapminder$country == pais])
  if (media < 50) {
    print(paste("en", pais, "la media de vida es menor a 50"))
  } else if (media > 70) {
    print(paste("en", pais, "la media de vida es mayor a 70"))
  } else {
    print(paste("en", pais, "la media de vida esta entre 50 y 70"))
}
}

  
  
  
