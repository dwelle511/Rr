#61
wt <- mcar$wt
mpg- <- mcar$mpg
plot(wt,mpg,
     main="중량 -연비 graph",
     xlab="중량",
     ylab="연비(mpg)",
     col="red",
     pch=19)
#독종, 반응변수-설명 변수, x-y,
#intercept 절편, beers 기울기
#lm(): linear model

#64


#절편과 기울기 구하기
str(res)
coef(res)
res$coefficients

#65 con
cor(iris[,1:4])
cor(bal,beers)
cor(iris[,1:4]) #대각선은 상관계수 1

pairs(iris,1:4)


#66
mo=1:4
late=c(5,4,6,3)
plot(mo,
     late,
     main="late sudent",
     # type="l",
     lty=1,
     lwd=2,
     xlab="month",
     ylab="late cnt")

plot(mo,
     late,
     main="late sudent",
     type="o",
     lty=1,
     lwd=2,
     xlab="month",
     ylab="late cnt")

#67
mo=1:5
late1=c(3,4,5,6,7)
late2=c(4,5,6,8,2)
plot(mo,
     late1,
     main="Late Students",
     type="b",
     lty=1,
     col="red",
     xlab="month",
     ylab="late cnt",
     ylim=c(1,15))

lines(mo,   #lines: 위 그림에 지금 그림을 그림
      late2,
      type="b",
      col="blue")


#con 이건 뭐지,, 몰라. package is successed to checked
install.packages("mlbench")
library(mlbench)
data(BostonHousing)
head(BostonHousing)
str(BostonHousing)
 
#grp 안돌아가요 install 먼저하세요
library(mlbench)
data("BostonHousing")


myds <- BostonHousing[,c("crim","rm","dis","tax","medv")]
grp <- c()
for(i in 1:nrow(myds)){
  if (myds$medv[i]>=25.0){
    grp[i] <- "H"
  }else if (myds$medv[i]<=17.0){
    grp[i] <- "L"
  }else {
    grp[i] <- "M"
  }
}
grp <- factor(grp)
grp <- factor(grp,levels=c("H","M","L"))
myds <- data.frame(myds,grp)


#(3)add new column
str(myds)
head(myds)
table(myds$grp)

##(4)histogram
par(mfrow=c(2,3))
for(i in 1:5){
  hist(myds[,i],main=colnames(myds)[i],col="yellow")
} #plot 크기 늘려서 그래프 나오게 하기!!

par(mfrow=c(1,1))

par(mfrow=c(2,3))
for(i in 1:5){
  boxplot(myds[,i],main=colnames(myds)[i])
}
par(mfrow=c(1,1))



boxplot(myds$crim~myds$grp,main="1인당 범죄율")
boxplot(myds$rm~myds$grp,main="방의 개수")
pairs(myds[,-6]) #나머지 산점도로 다중으로 이룬다. 

point <- as.integer(myds$grp)
color <- c("red","green","blue") #color h red/m green/L blue !
pairs(myds[,-6],pch=point,col=color[point])

cor(myds[,-6])


#68
##(1)prepare data
library(mlbench)
data("BostonHousing")
myds <- BostonHousing[,c("crim","rm","dis","tax","medv")]

##(2)add new column
grp <- c()
for( i in 1:nrow(myds)){
  if(myds$medv[i]>=25.0){
    grp[i] <- "H"
  }else if(myds$medv[i]<=17.0){
    grp[i] <- "L"
  }else{
    grp[i] <- "M"
  }
}
grp <- factor(grp)
grp <- factor(grp,levels=c("H","M","L"))

myds <- data.frame(myds,grp)
str(myds)
head(myds)
table(myds$grp)

##(3)데이터셋 파악
str(myds)
head(myds)
table(myds$grp)

##(4)histogram
par(mfrow=c(2,3))
for(i in 1:5){
  hist(myds[,i],main=colnames(myds)[i],col="yellow")
}
par(mfrow=c(1,1))

##(5)boxplot   #box height: interquatulate:높이 1.5배 이상하 이상치임
#최대최소 선이 박스 높이 1.5배 아님!
par(mfrow=c(2,3))
for(i in 1:5){
  boxplot(myds[,i],main=colnames(myds)[i])
}
par(mfrow=c(1,1))

##6(boxplot ) by group
boxplot(myds$crim~myds$grp,main="1인다 버모지율")
boxplot(myds$rm~myds$grp,main="방수율")

boxplot(myds$dis~myds$grp,main="1직업센터까지 거리율")

boxplot(myds$tax~myds$grp,main="재산세율")

##7
pairs(myds[,-6])

point <- as.integer(myds$grp)
color <- c("red","green","blue")
pairs(myds[,-6],pch=point,col=color[point])


#8
cor(myds[,-6])










