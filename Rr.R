a <- c('a','a','a','a','b','b','b')
str(a)
class(a) 
unique(a)

#concept
summary(iris)
class(iris)
class(summary(iris))
#3-13
z <- matrix(1:20,nrow=4,ncol=5)
z
t(z)
#3-14
IR.1 <- subset(iris,Species=="setosa")
IR.1
IR.2 <- subset(iris,Sepal.Length>5.0&
                 Sepal.Width>4.0)
IR.2
IR.2[,c(2,4)]
#3-15
a <- matrix(1:20,4,5)
b <- matrix(21:40,4,5)
a
b
a**4
b%%2
#3-16
class(iris)
class(state.x77)
is.matrix(iris)
is.data.frame(iris)
is.matrix(state.x77)
is.data.frame(state.x77)

state.x77
str(state.x77)
class(state.x77)
is.matrix(state.x77)
is.data.frame(state.x77)
iris
str(iris)
class(iris)
is.matrix(iris)
is.data.frame(iris)

#a
a <- matrix(1:20,4,5)
str(a)
class(a)
is.matrix(a)
id.data.frame(a)

#iris
str(iris)
class(iris)
is.matrix(iris)
is.data.frame(iris)

#state.x77
str(state.x77)
class(state.x77)
is.matrix(state.x77)
is.data.frame(state.x77)

#concept
m <- matrix(1:6,nrow=2,ncol=3,byrow=TRUE,
            dimnames=list(c("Row1","Row2"),c("Col1","Col2","Col3")))
m

str(m)
class(m)
is.matrix(m)
is.data.frame(m)

#3-17
st <- data.frame(state.x77)
head(st)
class(st)

iris.m <- as.matrix(iris[,1:5])
head(iris.m)
class(iris.m)
#3-18
iris[,"Species"]
iris[,5]
iris["Species"]
iris[5]
iris$Species
iris[,1]
str(iris[,5])
is.factor(iris$Species)
is.vector(iris$Species)
is.vector(c(1,2))

#con
getwd() #작업공간 폴더 반환
setwd("C:\\Rr")
getwd()
airquality
str(airquality)
summary(airquality)
getwd()
write.csv(airquality,file="airquality.csv")
write.csv(airquality,file="Rr/airquality.csv")
write.csv(airquality,file="Rr\\airquality.csv")

#3-19
air <- read.csv("airquality.csv",header=T)
head(air)

#3-20
setwd("C:/Rr")
my.iris <- subset(iris,Species='Setosa')
write.csv(my.iris,"my_iris.csv",row.names=F)
