#4-1
job.type <- 'A'
if(job.type=='B'){
  bonus <- 200
}else{
  bonus <- 100
}
print(bonus)
#4-2
job.type <- 'B'
bonus <- 100
if(job.type=='A'){
  bonus <- 200
}
print(bonus)
#4-3
score <- 77
if(score>90){
  grade <- 'A'
}else if(score>80){
  grade <- 'B'
}else if(score>70){
  grade <- 'C'
}else if(score>60){
  grade <- 'D'
}else{
  grade <- 'F'
}
print(grade)
#4-4
a <- 10
b <- 20
if(a>5 &b>30){
  print(a+b)
}
if(a>5|b>30){
  print(a*b)
}
#4-5
a <- 10
b <- 20
if(a>b){
  c <- a
}else{
  c <- b
}
print(c)

a <- 10
b <- 20

c <- ifelse(a>b,a,b)
print(c)
#4-6
for(i in 1:5){
  print('*')
}
#4-7
for(i in 6:10){
  print(i)
}
#48 고양이? 리눅스같은데concatinate 
for(i in 1:9){
  cat('2*',i,'=','\n')
}
#concept
cat("the sum of",3,"and",5,"is",3+5,"\n")

for (i in 6:10){
  print(i)
}
for(i in 1:9){
  cat('2*',i,"=",2*i,'\n')
}  #print 사용 x
#49
for(i in 1:20){
  if(i%%2==0){
    print(i)
  }
}
#410
sum <- 0
for(i in 1:100){
  sum <- sum+i
}
print(sum)
#411
norow <- nrow(iris)
mylabel <- c()
for(i in 1:norow){
  if (iris$Petal.Length[i]<=1.6){
    mylabel[i] <- 'L'
  }else if (iris$Petal.Length[i]>=5.1){
    mylabel[i] <- 'H'
  }else {
    mylabel[i] <- 'M'
  }
}
print(mylabel)
newds <- data.frame(iris$Petal.Length,mylabel)
head(newds)
#con
norow <- nrow(iris)
mylabel <- c()
mylabel #아래 코드를 완성하시오.
for(i in 1:norow){
  
}
#4-12
sum <- 0
i <- 1
while(i<=10){
  sum <- sum+i
  i <- i+1
}
print(sum)
#ifelse(a<b,a,b) c언어 :? : 이거랑 비슷한듯
#여기 !!next!! break (c: break continue?)
#next 넘어가라 next 다음으로 가라는것
#4-13
sum <- 0
for(i in 1:10){
  sum <- sum +i
  if(i>=5)break
}
sum #con
sum(1:5)
#concept : 줄 간격 이렇게 바꿔도 된다
x <- 10
if(x>0)
  print("x는 양수 입니다")else
    print("x는 0이거나 음수 입니다")
if(x>0)print("x는 양수임")else print("x는 0이거나음음")
#414
sum <- 0
for(i in 1:10){
  if (i%%2==0)next
  sum <- sum+i
}
sum #con
sum(seq(1,10,2))
#con:~infinite~
repeat{
  num <- as.numeric(readline(prompt="숫자 입력하시오"))
  if(num==0){
    cat("프로그램을 종료합니다\n")
    break
  }
  cat("입력한 숫자 :",num,"\n")
}
#415
apply(iris[,1:4],1,mean)  #행 평균
apply(iris[,1:4],2,mean) #col mean

#con
apply(iris[,1:4],1,mean)
apply(iris[,1:4],MARGIN=1,mean)
apply(iris[,1:4],2,mean)
apply(iris[,1:4],MARGIN=2,mean)

range(1:10) #최소에서 최대
range(iris$Sepal.Length)
range(iris$Sepal.Width)
range(iris$Petal.Length)
range(iris$Petal.Width)

apply(iris[,1:4],MARGIN=2,min)
apply(iris[,1:4],MARGIN=2,max)
apply(iris[,1:4],MARGIN=2,range)

#416
mymax <- function(x,y){
  num.max <- x
  if(y>x){
    num.max <- y
  }
  return(num.max)
}
#417
mymax(10,15)
a <- mymax(20,15)
b <- mymax(31,45)
print(num.max)

#418

mydiv <- function(x,y=2){
  result <- x/y
  return (result)
  
}
mydiv(x=10,y=3)
mydiv(10,3)
mydiv(10)
#419
#con


myfunc <- function(x,y){
  val.sum <- x+y
  val.mul <- x*y
  return(list(sum=val.sum,mul=val.mul))
  
}
result <- myfunc(5,8)
s <- result$sum
m <- result$mul
s <- result[[1]] #con
m <- result[[2]]
cat('5+8=',s,'\n')
cat('5*8=',m,'\n')

#420
rm(list=ls())
source("ch04/myfunc.R")
a <- mydiv2(20,4)
b <- mydiv2(30,4)
a
b
a+b
mydiv2(mydiv2(20,2),5)

#421
score <- c(33,44,55,69,44,23,43,77,55)
which(score==69)
which(score>=85)
max(score)
which.max(score)
min(score)
which.min(score)

#cin
score[which(score==69)]
score[score==69]
score[which.max(score)]

#422
score <- c(64,34,64,42,11,47,97,87,65)
idx <- which(score<=60)
score[idx] <- 61
score


idx <- which(score>=80)
score.high <- score[idx]
score.high

#423
idx <- which(iris$Petal.Length>5.0)
idx
iris.big <- iris[idx,]
#con 
iris.big
str(iris.big)
#데이텉 객체 구조 간당히 요약해서보여주는f con
str(iris.big)

#2424 위치 조건 만족한는 인덱스 반환하는 f 
m <- matrix(1:9,nrow=3)
m
which(m>5)
result <- which(m>5,arr.ind=TRUE)
print(result)
result <- which(m>5,arr.ind=FALSE)
print(result)

result <- which(matrix(11:19,nrow=3)>15,arr.ind=FALSE)
print(result)
result <- which(matrix(11:19,nrow=3)>15,arr.ind=TRUE)
print(result)

##참조
m <- matrix(11:19,nrow=3)
m
result <- which(m>15) #자리위치숫자로 나옴 6789
print(result)
m[result]
m

print(result)
m[result]
m

result <- which(m>15,arr.ind=TRUE)
print(result)
m[result]
m[cbind(result[,1],result[,2])]

str(iris)
str(iris[,1:4]>5.0)
is.matrix(iris[,1:4]>5.0)

idx <- which(iris[,1:4]>5.0,arr.ind=TRUE)
idx
iris[,1:4][idx[1,1],idx[1,2]]
iris[1,1]

idx <- which(iris[,1:4]>5.0)
idx
#바로 참조 가능 
idx <- which(iris[,1.4]>5.0,arr.ind=TRUE)


#4-24
idx <- which(iris[,1:4]>5.0,arr.ind=TRUE)
idx
