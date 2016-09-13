x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
x
x[1]#El corchete es una función. Para matrices y vectores, significa “dame el elemento n°”
x[3]
x[c(1, 3)]
x[1:4]
x[c(1,1,3)]
x[6] # NA es que es vacio o no existe
x[-2:-3]# nos da los numeros sin los de la posicion 2 y 3 pero no lo guarda porque no lo asigne
x # llama directamente al objeto , es lo mismo q escribir print y el objeto
# ej 1
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
print(x)
x[c(2,3,4)]#  con c creas un vectpr con esos numeros
x[c(-1,-5)]
x[2:4] # como es un acceso directo a la fc seq no hace falta poner c
x[c(2:4)]
x[-c(1,5)]
# podemos hacer subconjuntos usando los nombres:
x["a"]
x[c("a","b")]
names(x) == "a"
which(names(x) == "a")
x[-which(names(x) == "a")]
x[-which(names(x) %in% c("a", ))]
x[-which(names(x) %in% c("a", "c"))]
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
print(x)
x[-which(names(x) == "g")]
names(x) == "g" # cual de los nombres cumple con llamarse g? dara que todos falsos  
?"%in%"
names(x) <- rep("a" ,5)
x
x["a"]
x[which(names(x) == "a")]
names(x) <- c('a', 'b', 'c', 'd', 'e')
print(x)
names(x) == c("a", "c") #es un vector de longitud mas corta entonces rcicla, es decir lo vuelve a repetir y el largo no es lo mismo
names(x) %in% c("a", "c") # q me de los elementos que coinciden con los nombre del vector q le doy.... hay q saber preguntra
names(x) == "a" | names(x) == "c"
x[c(TRUE, TRUE, FALSE, FALSE)] # como tengo uno mas recicla, pero no da ninguna dvertencia
x [x>7]
x [x<4] # no hay ninguno
 #compara con un intervalo | es igial a o
x [x >6 & x <7] # & es igual a "y"
all (x>4)

#ejercicio 3
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
print(x)
x [x >4 & x <7]
v <- x [x >4 & x <7]
v
x <- c(x,NA)
x
is.na(x)
x[!is.na(x)]
na.omit(x)
c(x, 4)
f <- factor(c("a", "a", "b", "c", "c", "d"))
f[f == "a"]
f[f %in% c("b", "c")]
f[1:3]
f[-3] # saca el valor pero el nivel sigue existiendo hay q convertir en factor para eliminbar los niveles fa
factor (f[-3])

set.seed(1) # da valores aleatreos
m <- matrix(rnorm( 6 * 4), ncol = 4, nrow = 6)
m
m[5,2]#selecciona fila 3, columna 4
m[3:4, c(3, 1)] #selecciona la secuencia q esta en las posiciones de fila3 a 4 , en la columna 3 y luego 1
m[, c(3, 1)] #selecciona toda la secuencia q esta en las posiciones de columna 3 y luego 1
m[3,] #crea un vector
m[3, , drop = FALSE] #sigue manteniendo el formato de matriz
?set.seed
m[,c(3, 6)] #si le pido una posicion q no existe a dif de los vectores q daba un NA aca da un error
m[5]



xlist <- list(a = "UNTDF", b = 1:10, data = head(iris))
xlist[1]
$data
$a
xlist[1:3]
xlist ["a"]
xlist [c("a", "data")]
xlist [[1:2]]
xlist [[3]]
xlist[["data"]]["Petal.Length"]
xlist[["data"]][[3]]
xlist$data$Petal.Length[xlist$data$Petal.Length == 1.5]
xlist$data["Petal.Length"][xlist$data$Petal.Length == 1.5, , drop = FALSE]

#ejercicio5
xlist <- list(a = "UNTDF", b = 1:10, data = head(iris))
xlist[1]
xlist
xlist[[2]] #nos devuelve el vector
xlist <- list(a = "UNTDF", b = 1:10, data = head(iris))
xlist[[2]][[2]]
xlist$b[2]

mod <- aov(pop ~ lifeExp, data = gapminder)
mod
str(mod)
attributes(mod)
names(mod)
mod$df.residual
head(gapminder[3], 5)
gapminder[gapminder$country == "Argentina", ]
gapminder[1, 3]
gapminder[, 3]
#Ejercicio 7
gapminder[gapminder$year == 1957,]
gapminder[,-(1:4)]

gapminder[gapminder$lifeExp == 80, ]
gapminder[gapminder$lifeExp > 80, ]
gapminder[1, 4, 5]
gapminder
str(gapminder)
