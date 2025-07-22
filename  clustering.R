#121
#y= ax+b ; a는 w가중치, b는 바이어스??
mydata <- iris[,1:4]

fit <- kmeans(x=mydata,centers=3)
fit
fit$cluster
fit$centers

library(cluster)
clusplot(mydata,fit$cluster,color=TRUE,shade=TRUE,
         labels=2,lines=0)
subset(mydata,fit$cluster==2)

#122
std <- function(X){
  return((X-min(X))/(max(X)-min(X)))
}
mtdata <- apply(iris[,1:4],2,std)
fit <- kmeans(x=mydata,centers=3)
fit


#123
if(!require(class)){
  install.packages("class")
}
library(class)
tr.idx <- c(1:25,51:75,101:125)
ds.tr <- iris[tr.idx,1:4]
ds.ts <- iris[-tr.idx,5]
cl.tr <- factor(iris[tr.idx,5])
cl.ts <- factor(iris[-tr.idx,5])

pred <- knn(ds.tr,ds.ts,cl.tr,k=3,prob=TRUE)
pred

acc <- mean(pred==cl.ts)
avv

table(pred,cl/ts)

#124 vsFolds는 패키지가 DAAG라함
if(!require(DAAG)){
  install.packages("DAAG")
}
library(DAAG)
k=10
folds <- cvFolds(nrow(iris),K=k)

acc <- c()
for( i in 1:k){
  ts.idx <- folds$which==i
  ds.tr <- iris[-ts.idx,1:4]
  ds.ts <- iris[ts.idx,1:4]
  cl.tr <- factor(iris[-ts.idx,5])
  cl.ts <- factor(iris[ts.idx,5])
  
  pred <- knn(ds.tr,ds.ts,cl.tr,k=5)
  acc[i] <- mean(pred==cl.ts)
}
acc
mean(acc)
















