#71
z <- c(1,2,3,NA,5,NA,8)
sum(z)
is.na(z)
sum(is.na(z))
sum(z,na.rm=TRUE)

#72
z1 <- c(1,2,3,NA,5,NA,8)
z2 <- c(5,7,1,NA,3,NA,7)
z1[is.na(z1)] <- 0
z1
z3 <- as.vector(na.omit(z2))
#con
n=na.omit(z2)
str(n)
typeof(n) 

#73
x <- iris
x[1,2] <- NA;x[1,3] <- NA
x[2,3] <- NA;x[3,4] <- NA
head(x)
str(x)

#con
is.na(x)
is.na(x[,1])
is.na(x[,2])
#for문이용 방법 : code 일부 실행 ncol(x) 선택 ctrl enter
for(i in 1:ncol(x)){
  this.na <- is.na(x[,i])  #vector익 다음은 sepalLength
  cat(colnames(x)[i],"\t",sum(this.na),"\n")
}
#apply이용하여 방법
col_na <- function(y){
  return (sum(is.na(y)))
}
#인자 2라는것은 열에 함수를 적용
na_count <- apply(x,2,FUN=col_na)
na_count

#concpet   이름이 없는 f; 익명함수
na_count <- apply(x,2,FUN=function(x)sum(is.na(x)))
na_count




#74
for(i in 1:ncol(x)){
  this.na <- is.na(x[,i])
  cat(colnames(x)[i],"\t",sum(this.na),"\n")
}
col_na <- function(y){
  return(sum(is.na(y)))
}
na_count <- apply(x,2,FUN=col_na)
na_count

#75
rowSums(is.na(x))
sum(rowSums(is.na(x))>0)
sum(is.na(x))

#concept
#76  #complete.case(): 행별로 검사해주는아이, 편함? 
head(x)  
x[complete.cases(x),] #na포함 안된 행 출력
x[!complete.cases(x),]#na 포함된 행들 출력

y <- x[complete.cases(x),] #na가 포함된 행들 제거
head(y)

#airquality
airquality
head(airquality)
sum(rowSums(is.na(airquality))>0)
air <- airquality[!complete.cases(airquality),]
air
nrow(air)
head(airquality[complete.cases(airquality),])

#outlier 특이값 이상치





#77
st <- data.frame(state.x77)
boxplot(st$Income)  #how to comprehend?
boxplot.stats(st$Income)$out # 이상값

#78
out.val <- boxplot.stats(st$Income)$out
out.val

st$Income[st$Income %in% out.val] <- NA #indexing /%in%은 
head(st)
newdata <- st[complete.cases(st),] #remove
head(newdata)

st <- data.frame(state.x77)
boxplot.stats(st$Income)
boxplot.stats(st$Income)$stats
boxplot.stats(st$Income)$n
boxplot.stats(st$Income)$cont
boxplot.stats(st$Income)$out




#79
v1 <- c(1,6,5,7,3,5,2,3)  #order() vs 걍 v1 호출시 차이
order(v1)
v1
v1 <- sort(v1)
v1
v2 <- sort(v1,decreasing=T)
v2

#710
head(iris)
order(iris$Sepal.Length)
iris[order(iris$Sepal.Length),]
iris[order(iris$Sepal.Length, decreasing=T),]
iris.new <- iris[order(iris$Sepal.Length),]
head(iris.new)
iris[order(iris$Species,-iris$Petal.Length,decreasing = T),]


#711
sp <- split(iris,iris$Species)
sp
summary(sp)
sp$setosa

#712
subset(iris,Species=="setosa")
sebset(iris,Sepal.Length>7.5)
subset(iris,Sepal.Length>5.1&
         Sepal.Width>3.9)
subset(iris,Sepal.Length>7.6,
       select=c(Petal,Length,Petal.Width))

#713
x <- 1:100
y <- sample(x,size=10,replace=FALSE)
y















