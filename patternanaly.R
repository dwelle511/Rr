install.packages("Rtsne")
install.packages("ggplot2")
library(Rtsne)
library(ggplot2)
ds <- iris[,-5]

dup=which(duplicated(ds))
dup
ds <- ds[-dup]
ds.y <- iris$Species[-dup]

tsne <- Rtsne(ds,dims=3,perplexity=10)
df.tsne <- data.frame(tsne$Y)
head(de.tsne)
ggplot(de.tsne,aes(x=X1,y=X2,color=ds.y))+
  geom_point(size=2)

##yester day
# 814
if(!require(Rtsne)){
  install.packages("Rtsne")
}
library(Rtsne)
library(ggplot2) # 패키지 로드
ds <- iris[,-5]
ds
str(ds)

iris[102,]
iris[143,] #똑같다!!!! 동일 데이터 존재시
#불러오는데 에러뜸!!!


duplicated(ds) #똑같은데 2번쨰 겹칠떄 true나옴
dup=which(duplicated(ds)) 
dup
ds <- ds[-dup,]
str(ds)
ds.y <- iris$Species[-dup]
str(ds.y)
length(ds.y)

#t-sne start
tsne <- Rtsne(ds,dims=2,perplexity=10)
tsne
str(tsne)

tsne$Y  #4개차원에서 2차원으로 줄여 2개줄임.



#축소 결과 시각화
df.tsne <- data.frame(tsne$Y)
head(df.tsne)
ggplot(df.tsne,aes(x=X1,y=X2,color=ds.y))+ #색 품종별
  geom_point(size=2)
#815

##
install.packages(c("rgl","car"))
library("car")
library("rgl")
library("mgcv")

tsne <- Rtsne(ds,dims=3,perplexity=10)
df.tsne <- data.frame(tsne$Y)
head(df.tsne)

scatter3d(x=df.tsne$X1,y=df.tsne$X2,z=df.tsne$X3)

points <- as.integer(ds.y)
color <- c('red','green','blue')
scatter3d(x=df.tsne$X1,y=df.tsne$X2,z=df.tsne$X3,
          point.col=color[points],
          surface=TRUE)
##다르 버전 다시 깔기
install.packages("https://cran.rproject.org/src/contrib/Archive/arules/arules_1.7-0.gz")

##10장 시작구
#105
if(!require("arules")){
  install.packages("arules")
}
if(!require("arulesViz")){
  install.packages("arulesViz")
}
library(arules)
library(arulesViz)

getwd()
ds <- read.csv("BreadBasket_DMS.csv")
str(ds)
head(ds)
unique(ds$Item)
#long 55 

ds.new <- subset(ds,Item !='NONE')
write.csv(ds.new,"BreadBasket_DMS_upd.csv",row.names=F)

trans <- read.transactions("BreadBasket_DMS_upd.csv",
                          format="single",header=T,
                          cols=c(3,4),sep=",",rm.duplicates=T)
#저 10 5 start 부터 실행해야 에러안남
trans
summary(trans)
dimnames(trans)[[2]]
dimnames(trans)[[1]]



toLongFormat(trans)
inspect(head(trans,10))


#106 start
itemFrequencyPlot(trans,topN=10,type="absolute",xlab="상품",
                  ylab="절대 판매빈도",main="판매량 많ㅡㅇㄴ 상품",
                  col="green")
itemFrequencyPlot(trans,topN=10,type="relative",xlab="상품명",
                  ylab="상대 판매빈도",main="판매량 맣은 상품",
                  col="blue")

rules <- apriori(trans,parameter=list(supp=0.001,conf=0.7))
rules

#con
summary(rules)
##apriori : 규칙의 rule 만들게요?? 지지도 0.001 / 
options(digits=2)
inspect(rules[1:10])
inspect(rules)



#106 double 
#신뢰도 상위 10개 extract
rules.sort <- sort(rules,by='confidence',decreasing=F)
inspect(rules.sort[1:10])

rules.sort <- sort(rules,by='lift',decreasing=T)
inspect(rules.sort[1:10])

plot(rules,measure=c("support","lift"),shading="confidence")
#산점도 graph plot
plot(rules.sort,method="graph")
#graph plot
plot(rules.sort,method="grouped")

write(rules.sort,file="BreadBasket_rules.csv",sep=',',quote=T,
      row.names=F)






