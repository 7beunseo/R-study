x=c(1.9, 0.8, 1.1, 0.1, -0.1, 4.4, 4.6, 1.6, 5.5, 3.4)
y=c(0.7,-1.0, -0.2, -1.2, -0.1, 3.4, 0.0, 0.8, 3.7, 2.0)

# 회귀분석 결과를 저장 
out <- lm(y~x)

# 회귀분석 결과 출력 
summary(out)
# p-value: 0.005231
# Adjusted R-squared:  0.599 
# hat y = -0.7861(hat b0) + 0.6850 (hat b1)

# 산점도
plot(x, y)

# 추정된 회귀직선 그리기
abline(out)

# 추정값 (원래 데이터 x에서의 추정값) 
out$fitted.values
predict(out)
predict(out, newdata=data.frame(x=x)) # 변수명 지켜야 함 

# x=2.3에서의 반응 추정값
# 구체적인 값들에 대한 추정값을 얻을 수 있음 !! 
pred_1 <- predict(out, newdata = data.frame(x=2.3))
pred_1

# X더, 2.2, 6.7에서 각각 반응 추정값
pred <- predict(out, newdata = data.frame(x = c(1, 2.2, 6, 7)))
pred


#####
# 2 #
#####

# 부피 -> 설명번수, 무게 -> 반응변수 
volumn = c(412,953,929,1492,419,1010,595,1034)
weight = c(250, 700,650, 975,350,950,425,725)
book.lm <- lm(weight ~ volumn)
summary(book.lm)
# p-value: 0.0006445
# Adjusted R-squared:  0.8539 
# y = 41.3725 + 0.6859 X
# hat(weight) = 41.3725 + 0.6859 X volumn 
# 추정된 회귀직선의 설명력이 높음 (R^2)

# 회귀계수의 유의성 검정
# 귀무가설 : b1 = 0 (일차 계수가 0이다) 
# p-value = 0.000644 < 0.05 -> 귀무가설 기각! 
# 추정된 회귀계수는 유의하다 

# 회귀분석 결과를 포함한 객체의 속성 
attributes(book.lm)

# 회귀계수 출력 
book.lm$coefficients
book.lm$coef

# 잔차 출력 
book.lm$residuals
weight - book.lm$fitted.values # 잔차 = 관측값 - 추정값 (predict, fitted.values) 

# 추정값
book.lm$fitted.values
predict(book.lm)

# 그래프
plot(book.lm)


#####
# 3 #
#####

# 이차항이 포함된 선형회귀모형 
book.lm2 <- lm(weight ~ volumn + I(volumn^2))
summary(book.lm2)
# p-value: p-value: 0.0476
# Adjusted R-squared:  0.8668
# Multiple R-squared:  0.9049 -> 추정된 회귀직선의 설명력이 높다. 
# 추정회귀식 y = -193 + 1.297 x + -00034 x^2

# 귀무가설 : (b1 = 0) 일차 회귀계수가 0이다
# p-value = 0.0476 < 0.05 -> 귀무가설 기각 -> 추정된 일차 회귀계수는 유의함 

# 귀무가설 : (b2 = 0) 이차 회귀계수가 0이다 
# p-value = 0.2643 > 0.05 -> 귀무가설 기각하지 못함 -> 추정된 이차 회귀계수가 유의하지 않음 


#####
# 4 #
#####

# 원점을 지나는 회귀직선 
book.lm3 <- lm(weight ~ volumn + 0) # 0을 넣어줌 -> 절편 사라짐 
summary(book.lm3)
# 추정회귀식 
# y = 0.72759 x 
# Multiple R-squared:  0.9823, -> 추정된 회귀직선의 설명력이 높은 편이다. 

# 귀무가설 : (b1=0) 일차 회귀곗의 유의성 검정 
# p-value: 2.141e-07 -> 귀무가설 기각 -> 추정된 회귀계수는 유의하다 
plot(book.lm3)


#####
# 5 #
#####

# 다중 선형 회귀모형
all <- read.csv("intensity.csv", h=T)
attach(all)
out <- lm(intensity~temperature+pressure)
summary(out)
# y hat = -1180.2817 + 0.9945 * temperature + 18.7559 * pressure
plot(out)

# temp=200, pressure=63일경우의 예측값?
predict(out, newdata=data.frame(temperature=200, pressure=63))
# 200.2472

#####
# 6 #
#####

# 상호작용이 포함된 다중회귀식
out2 <- lm(intensity~temperature+pressure+temperature:pressure)
summary(out2)
# 모두 유의하지 않음 -> p-value < 0.05 없음 

#####
# 7 #
#####

# 각 변수에 로그를 취한 값의 선형회귀식
out3 <- lm(log(intensity) ~ log(temperature) + log(pressure))
summary(out3)
# hat log(intensity) = -39.0390 + 1.1831 * log(temperature) + 9.2060 * log(pressure)
