#7단원 : 특이값을 볼수 있구요.boxplot.stats():통계량 나옴
#0 ,100 :out 은 특이값 // par(mfrow=c(1,3)) par(mfrow=c(1,1)end//
#pairs(): 산점도 import!!, plot(): pch():spot style, xlab:ylab()
#res=:회귀식, abline(res):cor():상관계수 높음/lm()
#plot(): 

#7-1
z <- c(1,2,3,NA,5,NA,8) 
sum(z)  #??
is.na(z)
sum(is.na(z))
sum(z,na.rm=TRUE)

#72
z1 <- c(1,2,3,NA,5,NA,8)
z2 <- c(5,7,3,NA,3,NA,8)
z1[is.na(z1)] <- 0
z1
z3 <- as.vector(na.omit(z2))
z3

#73
x <- iris
x[1,2] <- NA;x[1,3] <- NA
x[1,2] <- NA;x[1,2] <- NA
head(x)

#74
for(i in 1:ncol(x)){
  this.na <- is.na(x[,i])
  cat(colnames(x)[i],"\t",sum(this.na),"\n")
}


###data array sort

#79  첨자 ; 1,2,3,4,5,6,7
v1 <- c(1,5,6,6,4,2,3)
order(v1)
v1 <- sort(v1)
v1
v2 <- sort(v1,decreasing=T)
v2

#con
v1[order(v1)]
paste(v1[1],v1[6],v1[4],v1[2],v1[7])


#710
head(iris)
order(iris$Sepal.Length)
iris[order(iris$Sepal.Length,decreasing=T),]
iris.new <- iris[order(iris$Sepal.Length),]
head(iris.new)
iris[order(iris$Species,-iris$Petal.Length,decreasing=T),]

#con
order(iris$Sepal.Length)
range(iris$Sepal.Length)
iris[order(iris$Sepal.Length)[1],][1]

view(iris.50)
#711
sp <- split(iris,iris$Species)
sp
summary(sp)
str(sp)
class(sp)
typeof(sp)
mode(sp)


sp$setosa   #data frame is list 변형 
sp[1]
sp[[2]]



#712
subset(iris,Species=="setosa")
subset(iris,Sepal.Length>7.5)
subset(iris,Sepal.Length >5.1 & 
         Sepal.Width>3.9)
subset(iris,Sepal.Length>7.6,
       select=c(Petal.Length,Petal.Width))
#select

iris[c(1,2)]
iris[colnames(iris)[1:2]]
subset(iris,Sepal.Length>7.6)[colnames(iris)[3:4]]

iris[1,]
iris[]


##con
sample(1:10,4)
sample(1:10,33)



#713 replace f 비복 원 / replce true 복원추출
x <- 1:100
y <- sample(x,size=10,replace=FALSE)
y

#714
idx <- sample(1:nrow(iris),size=50,
              replace=FALSE)
iris.50 <- iris[idx,]
dim(iris.50)
head(iris.50)




#715

sample(1:20,size=5)
sample(1:20,size=5)
sample(1:20,size=5)

set.seed(100)
sample(1:20,size=5)
set.seed(100)
sample(1:20,size=5)
set.seed(100)
sample(1:20,size=5)


#t설치 방법
if(!require(dplyr)){
  install.packages("dplyr")
}
library(dplyr)

sample_n(iris,5)
sample_frac(iris)
sample_frac(iris,.3) #.1 15개 .3 45개



#716 combn():개중 3개 뽑을게 (순서x)
combn(1:5,3)

x=c("red","green","blue","black","white")
com <- combn(x,2)
com

for(i in 1:ncol(com)){
  cat(com[,i],"\n") #열 출력
}


#con 조합 5c3임
choose(5,3)
choose(5,3)
choose(5,3)



#717
agg <- aggregate(iris[,-5],by=list(iris$Species),
                 FUN=mean)
agg

#718
agg <- aggregate(iris[,-5],by=list(표쥰편차=iris$Species),
                 FUN=sd)
agg

#719
head(mtcars)
str(mtcars)
agg <- aggregate(mtcars,by=list(cyl=mtcars$cyl,
                                 vs=mtcars$vs),FUN=max)
agg

agg <- aggregate(mtcars,by=list(cyl=mtcars$cyl,
                                vs=mtcars$vs),FUN=mean)
agg

agg <- aggregate(mtcars,by=list(am=mtcars$am,
                                vs=mtcars$vs),FUN=mean)
agg





#720
x <- data.frame(name=c("a","b","c"),math=c(90,80,30))
y <- data.frame(name=c("a","b","d"),korea=c(70,60,90))
x
y

#721
z <- merge(x,y,by=c("name"))
z

#722
merge(x,y,all.x=T)
merge(x,y,all.y=T)
merge(x,y,all=T)






#723
x <- data.frame(name=c("a","b","'c"),math=c(90,79,48))
y <- data.frame(sname=c("a","b","'d"),korea=c(60,29,58))
x
y
merge(x,y,by.x=c("name"),by.y=c("sname"))
merge(x,y) # 3*3 =9개행 됨

#공통인 열이 없으면 모든 조합의 병합
#공통열이 없 모든 행 을 생성 , 공통열 존재시 해당
#열을 기준으로 데이터 병합










