#51
fa <- c('winter','summer','spring','summer','summer'
        ,'fall','fall','summer','spring','spring')
fa
table(fa)
table(fa)/length(fa)

#52
ds <- table(fa)
ds
barplot(ds,main='my like season') #barplot():graph emerge
barplot(ds,main='godgod season',las=1)#concept


#53
ds <- table(fa)
ds
pie(ds,main='cherish season')

#54 도수분포표 d:한 범위에서 얼만큼 차지하는냐
fa.color <- c(2,3,2,1,2,1,3,2,1,3,2,1,2)
ds <- table(fa.color)
ds
str(ds) #난 table이얌
str(fa.color) #난 num
barplot(ds,main='lovely color')
colors <- c('green','red','blue')
names(ds) <- colors
ds
barplot(ds,main='loving col')#축 레이블을 축에 평행
barplot(ds,main='loving col',las=0) #축 레이블을 축에 평형

barplot(ds,main='loving col',las=1) #축 레이블을 축에 평형
barplot(ds,main='loving col',las=2)#label,style 축 레이블ㅇ르 수평
barplot(ds,main='loving col',las=3)#

pie(ds,main='favorite color',col=colors)

#concoet 범주형 자료
ge <- c("m","f","m","m","m","f","f","f")
ge_factor <- factor(ge)
print(ge_factor) <- factor(ge)

levels(ge_factor)

size <- c("small","large","small","large","medium")
size_factor(size,levels=c("small","large","medium"))
print(size_factor)
levels(size_factor)
nlevels(size_factor)
calss(size_factor)

gr <- c("c","b","a","b","c")
gr_factor <- factor(gr,levels=c("c","b","a",orderd=TRUE))
print(gr_factor)
gr_factor[1]<gr_factor[2]
nlevels(gr_factor)

bl <- c("a","b","o","a","b","ab","o","a")
bl_factor <- factor(bl)
table(bl_factor)
nlevels(bl <- factor)


ds <- c(4,6,8,3)
names(ds) <- c("red","green","blue","purple")
colors=names(ds)

par(mfrow=c(2,2))
barplot(ds,main='loving col',las=2)#label,style 축 레이블ㅇ르 수평



rm(list=ls())

#concept :boxplot
dev.off()


dist <- cars[,2]
boxplot(dist,main="자돝차 제동거리")
range(cars[,2])
quantile(cars[,2])

boxplot(cars[,1],main="car velocity")
range(cars[,1])


#55
we <- c(60,62,63,64,68,69)
we.heavy <- c(we,120)
we
we.heavy

mean(we)
mean(we.heavy)

median(we)
median(we.heavy)

mean(we,trim=0.2)
mean(we.heavy,trim=0.2)

#56
md <- c(60,62,63,64,68,69,120)
quantile(md)
quantile(md,c(.1,.2,.6,.7)) #비율 입력한 수치를 반환

quantile(md,(0:10)/10) #10%구간 나누어 구함
summary(md)


md <- c(60,62,63,64,68,69,120)
quantile(md)
quantile(md,probs=.25,type=7)
quantile(md,probs=.25,type=6)
quantile(md,(0:10)/10)
summary(md)

#57
md <- c(60,62,63,64,68,69,120)
var(md) #분산 평균떨어진 정도
sd(md)#표준편차
range(md)#값 범위
diff(md)#최대값 , 최솟값 차이

diff(range(md)) #최대 최소의 차이
diff(c(150,22))
diff(range(c(150,22)))
diff(c(10,100))

cars
str(cars)
head(cars)



#58 hist d:data visualize tool
dist <- cars[,2]
hist(dist,
     main="histrgram for 제동distance",
     xlab="제동거리",
     ylab="빈도수",
     borde="blue",
     col="green",
     las=1,
     breaks=7)

hist(dist,
     main="histrgram for 제동distance2",
     xlab="제동거리",
     ylab="빈도수",
     borde="blue",
     col="green",
     las=3,
     breaks=3)





#59
dist <- cars[,2]
boxplot(dist,main="제동거리 자동차")
#510
boxplot.stats(dist) #out ,conf 95%?,  n개수, status?
boxplot.stats(dist)$conf

#511
boxplot(Petal.Length~Species,data=iris,main="품종별 꽃잎의 길이")
#formula 형식 : ~ : 왼(ylab)~오른(xlab)

#dd parameter, multi-frame by row
dev.off() #add -> 갑자기 막대 그래프 3개 나옴
par(mfrow=c(1,3)) #par 1행 3열, 원소는 그래프 덩어리
barplot(table(mtcars$carb),
        main="Barplot of Carburetors",
        xlab="#of carburtors",
        ylab="frequency",
col="blue")

barplot(table(mtcars$cyl),
        main="Barplot of Cylender",
        xlab="#of cylender",
        ylab="frequency",
        col="red")

barplot(table(mtcars$gear),
        main="Barplot of Grar",
        xlab="#of gears",
        ylab="frequency",
        col="Green")
par(mfrow=c(1,1))

mtcars

