rm(list=ls())

#81
if(!require(treemap)){
  install.packages("treemap")
}

library(treemap)
data(GNI2014)  #str()전에 data()선행되야하는 이유는??
str(GNI2014)
GNI2014
head(GNI2014)
dev.off()  #그림이 안나오면 나를 사용하세요
treemap(GNI2014,
        index=c("continent","iso3"), #IMPOERT
        vSize="population",  #SQUARE SIZE
        vColor="GNI",
        type="value",
        title="World s GNI")

tressmap(GNI2014)
#concept
sales.df <- data.frame(
  Category=c("Electronics","Electronics","Clothing","Clothing","Food"),
  Subcategory=c("TV","Phone","Shirt","Pants","Snacks"),
  Sales=c(300,500,200,150,400)
)

sales.df
#type : "","","index","densirty","category"
treemap(sales.df,
        index=c("Category","Subcategory"),
        vSize="Sales",
        vColor="Sales",
        type="value",
        title="제품 카테고리별 판매량 트리맴")

#82
dev.off()
library(treemap)
st <- data.frame(state.x77)
st <- data.frame(st, stname=rownames(st))

treemap(st,
        index=c("stname"),
        vSize="Area",
        vColor="Income",
        type="value",
        title="USA states area and incone")
#con
treemap(st,
        index=c("stname"),
        vSize="Population",
        vColor="Income",
        type="Population",
        title="USA states area and incone")


#83
dev.off()
st <- data.frame(state.x77)
symbols(st$Illiteracy,st$Murder, #첫 단어 대문자로
        circles=st$Population,
        inches=0.3,  #가장 큰 원이 0.3인치야알겠니/
        fg="yellow", #테두리 col
        bg="lightgray",
        lwd=1.5, 
        xlab="rate of illiteracy",
        ylab="crime(murder) rate",
        main="illiteracy and crime")
text(st$Illiteracy,st$Murder, #동그라미 위에 글자 넣음
     rownames(st),
     cex=0.6,
     col＝"brown")

#con 문맹룰 최고 10
st[order(st$Murder, decreasing=T),][1:10,]
st[order(st$Murder),][1:10,]
   
   #최하 10
st[order(st$Illiteracy, decreasing=T),][1:10,]
st[order(st$Illiteracy),][1:10,]




#84
head(mtcars) #~X AXIS, +Y AXIS
mosaicplot(~gear+vs, data= mtcars,color=c("green","blue"),
           main="gear and vs")
mosaicplot(~gear+vs, data= mtcars,color=c("red","yellow"),
           main="gear and vs")


#con 순서가 반대로 해야 쉽게 이해
table(mtcars$vs,mtcars$gear)
prop.table(table(mtcars$vs,mtcars$gear)) #모든
#셀의 합이 1, 확률로 보이게
#X,Y 교환
mosaicplot(~vs +gear, data=mtcars,color=c("green","blue","red"),
           main="vvs nad gear")
#con
UCBAdmissions
str(UCBAdmissions)
class(UCBAdmissions)

dim(UCBAdmissions) #2행 2열 6블럭
 #파이썬 : 블럭 행 열
dimnames(UCBAdmissions) #더 많은 내용 존재,
#행 열 각각 들어있는거 보여줌

ucb <- UCBAdmissions
ucb
ucb[,,'A']
ucb[,,'F']

mosaicplot(~Gender+Admit,data=UCBAdmissions,color="red",
           main="gender ")
mosaicplot(~Gender+Admit,data=UCBAdmissions,color=c("red","blue"),
           main="uc berkeley admission ")

#con 5th class
#table 로 바로 모자이크 그리기
mosaicplot(~vs +gear, data= mtcars,color=c("red","yellow"),
           main="gear and vs")
tab <- table(mtcars$vs,mtcars$gear)
tab
str(tab)
mosaicplot(tab,color=TRUE,
           main="gear ang vs")
mosaicplot(~gear +vs,data=mtcars, color=TRUE,
           main="gear anf vs")
tab <- table(mtcars$gear, mtycars$vs)
tab
mosaicplot(tab,color=TRUE,main="gear and vs")

#table 직접 생성


t <- table (c(1,2,3,1,1,2,2,3,3,1,2,3))
t
str(t)
#2차원 태이블
mytab <- structure(
  c(2,3,1,4), #ccount 값
  dim=c(2,2),# 2 행 2열
  dimnames=list(
    Gender= c("Male","Female"),  #행 이름
     Result=c("Pass","Fail")  #열 이름
    
  ),
  class="table"
)
mytab
str(mytab)
class(mytab)


#con
mat <- matrix(c(5,6,5,8),nrow=2,
              dimnames=list(c("A","b"),c("X","Y")))
class(mat)
mat  
str(mat)
class(mat)
#3dimension~~
tab3d <- array(
  c(1:16),
  dim=c(2,2,4),
  dimnames=list(
    Gender=c("M","F"),
    Result=c("Yes","no"),
    Group=c("G1","G2","G3","G4")
  )
)
class(tab3d) <- "table"
tab3d
str(tab3d)
class(tab3d)

rm(list=ls())
#con
library(ggplot2)
mpg
str(mpg)
#home page code  #tibble??
dev.off()
ggplot(mpg,aes(displ,hwy,colour=class))+ #displ L임!!
  geom_point() #mpg? x axis  , y axis,color
str(mpg)

#ggplot2 철학
#e데이터 +
#

#85
library(ggplot2)
month <- c(1,2,3,4,5,6)
rain <- c(55,59,36,73,44,67)
df <- data.frame(month,rain)
df

ggplot(df,aes(x=month,y=rain))+
  geom_bar(stat="identity",
           width=0.6,
           fill="steelblue")

#86
ggplot(df,aes(x=month,y=rain))+
  geom_bar(stat="identity",  #막대 높이는 y축에 해당값 
           width =0.7,
           fill="steelblue")+  #;막대색
  ggtitle("월 별 강수량")+  #제목지정
  theme(plot.title=element_text(size=25,face="bold",colour="steelblue"))+
  labs(x="월",y="강수량")+  #
  coord_flip() #t() 이거랑 비슷한 효과 인듯
if(!require(gglpot2)){
  install.packages("gglpot2")
}

ggplot(dr,aes(x=month,y=rain))+
  geom_bar(stat="identify",
           width=0.7,
           fill="blue")+
 ggtitle(size=25, face="bold",face="bold",colour="blue"),
theme(plot.title=element_text(size=25,face))
##angle=0, vjust=0.5 ??????






#87
library(ggplot2)
ggplot(iris,aes(x=Petal.Length))+
  geom_histogram(binwidth=0.5)

ggplot(iris,aes(x=Petal.Length))+
  geom_histogram(binwidth=1)

par(mfrow=c(1,2))
ggplot(iris,aes(x=Petal.Length))+
  geom_histogram(binwidth=1)


ggplot(iris,aes(x=Petal.Length))+
  geom_histogram(binwidth=0.5)
par(mfrow=c(1,1))



#88
range(iris$Sepal.Width)
ggplot(iris,aes(x=Sepal.Width))+
  geom_histogram(binwidth=0.5)

libarary(ggplot2)
ggplot(iris,aes(x=Sepal.Width,fill=Species,color=Species))+
  geom_histogram(binwidth=0.5,position="dodge")+
  theme(legend.position="top") #범례 : 


ggplot(iris,aes(x=Sepal.Width,fill=Species,color=Species))+
  geom_histogram(binwidth=0.5,position="stack")+
  theme(legend.position="top") #범례 : 


##concept
if(!require(gridExtra)){
  install.packages("gridExtra")
}

library(gridExtra)

g1 <- ggplot(iris,aes(x=Sepal.Width,fill=Species,color=Species))+
  geom_histogram(binwidth=0.5,position="dodge")+
  theme(legend.position="top")
g2 <- ggplot(iris,aes(x=Sepal.Width,fill=Species,color=Species))+
  geom_histogram(binwidth=0.5,position="stack")+
  theme(lengen.position="top")
#플롯 배열 2row 1col
grid.arrange(g1,g2,nrow=1,ncol=2)



#89
library(ggplot2)
ggplot(data=iris,aes(x=Petal.Length,y=Petal.Width))+
  geom_point()

#810
library(ggplot2)
ggplot(data=iris,aes(x=Petal.Length,y=Petal.Width,
                     color=Species))+
  geom_point(size=2)+
  ggtitle("꽃잎의 길이 와 폭")+
  theme(plot.title=element_text(size=25,face="bold",colour="steelblue"))

#811
library(ggplot2)
ggplot(data=iris,aes(y=Petal.Length))+
  geom_boxplot(fill="yellow")

#812
library(ggplot2)
ggplot(data=iris,aes(y=Petal.Length,fill=Species))+
  geom_boxplot()

#813  #mosaicplot() mosaicplot()
library(ggplot2)
year <- 1937:1960
airmiles
str(airmiles)
class(airmiles)
summary(airmiles)


cnt <- as.vector(airmiles)  #airmile : 여객수송 거리
df <- data.frame(year,cnt)
head(df)

ggplot(data=df,aes(x=year,y=cnt))+
  geom_line(col="red")

plot(airmiles)

rm(list=ls())


#t-sne: 알고리즘 구현 패키2ㅣ
#t-sne: 고차원의 데이터를 저차원으로
#임베딩 당하는데 사용되는 바선형 차원 축소 방법으로
#데이터의 구조적 패턴을 시각화 하는데 데 매우 유용
#t-distributed stockhastic neighbor embedding
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
install.packages(c("rgl","car","mgcv"))
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
          surface=FALSE)








