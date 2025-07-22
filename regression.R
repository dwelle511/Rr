# reverse of regression is -> 분류(classifiy)/ 로지스터 회귀
#는 분류임 // 

#11.1

#con
predict(model)
cars[,2]-predict(model)

pred <- W*speed+b
pred

compare <- data.frame(pred,cars[,2],pred-cars[,2])
compare

colnames(compare) <- c('예쌍','실제','오차')
head(compare)

#######

head(cars)

plot(dist~speed,data=cars)
plot(cars$speed,cars$dist) #??

#lm=linear model
#종속변수 독립변수 # y= 3.9x -18
model <- lm(dist~speed,cars)
model

str(model)
model$coefficients


abline(model)
coef(model)[1] #b value, 절편
coef(model)[2]# a value, 계수

class(model)

#112 
b <- coef(model)[1]  #ax+b 중 b
W <- coef(model)[2]# 기울기 a

speed <- 30
dist <- W*speed +b
dist

speed <- 35
dist <- W*speed+b
dist
speed <- 40
dist <- W*speed+b
dist

#113
speed <- cars[,1]
pred <- W*speed+b
pred

compare <- data.frame(pred,cars[,2],pred-cars[,2])
colnames(compare) <- c("예상","실제","오차")
head(compare)

#114 companion to applied regression, 회귀 분석 및 통계 모델 지원
# 다양한 도구를 제공하는 인기 있는 packages
if(!require(car)){
  install.packages("car")
}
library(car)
head(Prestige)
tail(Prestige)
str(Prestige)
class(Prestige)

sum(is.na(Prestige))



newdata <- Prestige[,c(1:4)] #data prepare
plot(newdata,pch=16,col="blue", #산점도를 통해 변수 간 관계확인 
     main="Matrix Scatterplot") #pch?
mod1 <- lm(income~education+prestige+  #regression extract
             women,data=newdata)
#census : 직업 식별 번호, type 직업 유형 (화이트, 블루, 프로페셔널)
summary(mod1)


#왜 안되는건가
#115 #adjusted r square : 63.2% / 
if(!require(MASS)){
  install.packages("MASS")
}
if(!require(carData)){
  install.packages("carData")
}
library(MASS)
library(carData)
str(prestige)
newdata2 <- Prestige[,c(1:5)]
head(newdata2)
mod2 <- lm(income ~education+prestige+ #뒤에 4개
             women +census,data=newdata2)
summary(mod2)


mod3 <- setpAIC(mod2) #LM 하고 MODEL 3로 만든다??
mod3
summary(mod3)

##aic - akaike information criterion
#stepAIC: 단계에서 AIC 값이 갖아 크게감소하는 variable 제거하면서
#최적의 모형을 찾는것 // 단계가 올라갈수록 단계의 aic 작아짐
#단계와 aic 반비레??
#aic ; 적절성과 간결성 평가 지표, 작을 수록 좋음!

#con
x <- 1:10
y <- 2*x+rnorm(10) # rnorm?
smodel <- lm(y~x)

plot(x,y) #산점도 그리기
abline(smodel)

dev.off() # 
plot(x,y) # line add ing (2)
abline(coef(smodel)[1],coef(smodel)[2]) #1은 절편, 2는 기울기slope

plot(x,y) #style adjust
abline(smodel,col="red",lty="dashed",lwd=2)


#로지스틱 회귀모델 시작이예요  : glm() use !
#11.6 다 안됨
iris.new <- iris
iris.new$Species <- as.integer(iris.new$Species)
head(iris.new)
mod.iris <- glm(Species ~., data=iris.new) # ~., ㅋㅋㅋㅋㅋ
summary(mod.iris)

#11/7
unknown <- data.frame(rbind(c(6.1,3.6,1.4,0.2)))
names(unknown) <- names(iris)[1:4]
unknown

pred <- predict(mod.iris,unknown)
pred
round(pred,0)

pred <- round(pred,0)
pred
levels(iris$Species)
levels(iris$Species)[pred]



#11.8   # mod.iris 는 어디 페이지에 잇니...위에 도 동일 이유
test <- iris[,1:4]
pred <- predict(mod.iris,test)
pred <- round(pred,0)

pred

answer <- as.integer(iris$Species)  # 실제 품종 정보
pred==answer     # 예측 품종 과 실제 품종이 같은지 비교ㄱㄱ?
iris[pred !=answer,]

acc <- mean(pred==answer)

acc

146/150
sum(pred==answer)/nrow(iris)

#end

#con
#원래는 이게 새로운 방법 multinom()활용
if(!require("nnet")){
  install.packages("nnet")
}
library(nnet)

data(iris)
iris.name <- iris

#다항 로지스틱 회귀 , 
#범주형 종속 변수 가 3개 이상의 수준을 갖는 경우 사용
mod.iris <- multinom(Species ~.,iris.new)

pred_species <- predict(mod.iris,type="class")
pred_species

iris[pred_species != iris$Species,] #이줄 오류이유좀

acc <- mean(pred_species==iris$Species)
acc










