## 주의
# 1. 잔차, 잔차제곱합, 회귀제곱합 모두 y 값이 기준 

#####
# 1 #
#####

x <- c(10, 5, 7, 19, 11, 8)
y <- c(15, 9, 3, 25, 7, 13)

# a
lm1 <- lm(y ~ x)
summary(lm1)
# y = -0.6667 + 1.2667 x

# b
lm1$fitted.values
predict(out, newdata=data.frame(x=x)) # x 값에 대한 추정 

# c
lm1$residuals

y - out$fitted.values # 관측값(y) - 추정값 (x에 빠는 게 아니라 y에 빼야 함)
out$residuals # 잔차 출력 

# d
sum(lm1$residuals ^ 2)
# 101.4667

# e
sum((lm1$fitted.values - mean(y))^2) # mean(y)로 구해야 함. mean(x) 아님! 
# 192.5333

# f
# Adjusted R-squared:  0.5686  -> 설명력 중간 
# Multiple R-squared:  0.6549,	Adjusted R-squared:  0.5686 
# Multiple R-squared -> 얘가 R^2 결정계수임 

# g
plot(y, lm1$residuals)
# 오차의 독립성을 만족함 


#####
# 2 #
#####
# 목화수확량 데이터 (표 9.5)

irrigation <- c(1.8, 1.9, 2.5, 1.4, 1.3, 2.1, 2.3, 1.5, 1.5, 1.2, 1.3, 1.8, 3.5, 3.5)
yield <- c(260, 370, 450, 160, 90, 440, 380, 280, 230, 180, 220, 180, 400, 650)

lm2 <- lm(yield ~ irrigation)
summary(lm2)
# p-value: 0.0001332 -> 일차 회귀계수 유의함 
# y = -24.49 + 167.86 x 
# Multiple R-squared:  0.717,	Adjusted R-squared:  0.6934 

# 각 x점에서 추정값을 구하기
out$fitted.values

# 잔차구하기
out$residuals
yield - out$fitted.values

# 잔차 제곱합 구하기
sum((yield - out$fitted.values)^2)
sum(out$residuals^2)

# 회귀 제곱합 구하기
sum((out$fitted.values - mean(yield))^2) # 제곱해야함 주의 


#####
# 4 #
#####

x <- c(4, 6, 6, 8, 8, 8, 9, 9, 10, 12)
y <- c(9, 10, 18, 20, 15, 17, 20, 22, 25, 30)

# 1
plot(x, y)
lm4 <- lm(y ~ x)
abline(lm4)

# 2
plot(lm4$fitted.values, lm4$residuals)
summary(lm4)
# Multiple R-squared:  0.8497,	Adjusted R-squared:  0.831 -> 설명력이 높다 
# -2.2696 + 2.6087 x
# p-value: 0.0001487 -> 추정된 회귀계수가 유의함 

# 3
length(x)
t_val <- (coef(lm4)[2] - 1.5) / summary(lm4)$coefficients[2,2]
p_val <- 1 - pt(t_val, df = (length(x) - 2))
p_val
# p=value 0.01059865 -> 귀무가설 기각 -> 기울기는 1.5보다 크다고 할 수 있음 (확인 필요) 


#####
# 5 #
#####

x <- c(40, 50, 60, 70, 80, 90, 40, 60, 80, 50)
y <- c(69, 175, 272, 335, 490, 415, 72, 265, 492, 180)

# a
plot(x, y)

# b
lm5 <- lm(y~x)
summary(lm5)
# y = -252.2971 + 8.5290 x

# c
# p-value: 1.434e-05 -> 추정한 일차 계수 유의함

# d
# Multiple R-squared:  0.9156,	Adjusted R-squared:  0.9051 
# 잘 설명함 

# e
lm5$fitted.values

# f
lm5$residuals

# g
plot(lm5$fitted.values, lm5$residuals)
# ?

# h
plot(lm5) # 만족한다고 할 수 있음 

# i
predict(lm5, newdata=data.frame(x=mean(x)))
# 276.5 


#####
# 6 #
#####

x <- c(3.5, 4.0, 4.5, 5.0, 5.0, 5.5, 6.0, 6.5, 7.0, 7.5, 8.0)
y <- c(24.4, 32.1, 37.1, 40.4, 43.3, 43.3, 51.4, 61.9, 66.1, 77.2, 79.2)

# a
plot(x, y)

# b
# 절편이 0
lm6 <- lm(y~x+0)
summary(lm6)
# y = 9.099 x 

# c
# p-value: p-value: 2.29e-11 -> 추정한 일차 회귀계수가 유의함 

# d 
# Multiple R-squared:  0.9902,	Adjusted R-squared:  0.9892: 0.9892 -> 잘 설명한다.

# b
lm6$fitted.values

# f
lm6$residuals

# g
plot(lm6$fitted.values, lm6$residuals)

# h
plot(lm6)

# i
predict(lm6, newdata=data.frame(x=5,3))
# 45.49435


#####
# 7 #
#####

# 온도 (X)
x <- c(280, 250, 300, 320, 310, 280, 320, 300, 320)

# 수축량 (Y)
y <- c(2.1, 3.0, 3.2, 1.4, 2.6, 2.7, 1.3, 3.4, 2.8)

# a
plot(x, y)
abline(lm7)

# b
lm7 <- lm(y~x)
summary(lm7)
# y = 6.42195 + -0.01317 x

# c
# p-value: 0.2616
# t-통계량 = -1.221
# 추정한 일차 회귀계수가 유의하지 않음 

# d
# Multiple R-squared:  0.1756,	Adjusted R-squared:  0.05784 
# 거의 설명하지 못함 

# e
lm7$fitted.values

# f
lm7$residuals

# g
plot(lm7$fitted.values, lm7$residuals)

# h

# i
predict(lm7, newdata=data.frame(x=400))


#####
# 8 #
#####

data(cars)
attach(cars)
plot(speed, dist)
abline(dist_1)

# a
dist_1 <- lm(dist~speed)
summary(dist_1)
# p-value: 1.49e-12 -> 추정한 일차 회귀계수 유의하다
# Adjusted R-squared:  0.6438  -> 중간정도 설명 
# y = -17.5791 + 3.9324 x 

# b
dist_2 <- lm(dist~speed + I(speed^2))
summary(dist_2)
# p-value: 0.656 추정한 일차 회귀계수 유의하지 않음 
# p-value: 0.136 추정한 이차 회귀계수 유의하지 않음 
# Adjusted R-squared:  0.6532  중간정도 설명 
# y = 2.47014 + 0.91329 x + 0.09996 + x^2

# c
dist_3 <- lm(dist~speed + 0)
summary(dist_3)
# p-value: < 2.2e-16 : 추정한 일차 회귀계수 유의
# y = 2.9091 x
# Adjusted R-squared:  0.8942  -> 잘 설명함 
