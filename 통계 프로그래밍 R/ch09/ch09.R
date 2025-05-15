x=c(1.9, 0.8, 1.1, 0.1, -0.1, 4.4, 4.6, 1.6, 5.5, 3.4)
y=c(0.7,-1.0, -0.2, -1.2, -0.1, 3.4, 0.0, 0.8, 3.7, 2.0)

# 회귀분석 결과를 저장 
out <- lm(y~x)

# 회귀분석 결과 출력 
summary(out)
# p-value: 0.005231
# Adjusted R-squared:  0.599 

# 산점도
plot(x, y)

# 추정된 회귀직선 그리기
abline(out)

# 추정값
out$fitted.values

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
# 추정된 회귀직선의 설명력이 높음 (R^2)

# 회귀계수의 유의성 검정
# 귀무가설 : 계수가 0이다 -> 기각! 
# 추정된 회귀계수는 유의하다 

attributes(book.lm)

# 회귀계수 출력 
book.lm$coefficients

# 잔차 출력 
book.lm$residuals

# 추정값
book.lm$fitted.values

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
# 추정회귀식 y = -193 + 1.297 x + -00034 x^2

# 귀무가설 : 일차 회귀계수가 0이다
# 귀무가설 기각 -> 추정된 회귀계수는 유의함 

# 귀무가설 : 이차 회귀계수가 0이다 
# 0.2643 -> 귀무가설 기가하지 못함 -> 추정된 회귀계수가 유의하지 않음 


#####
# 4 #
#####

# 원점을 지나는 회귀직선 
book.lm3 <- lm(weight ~ volumn + 0) # 0을 넣어줌 -> 절편 사라짐 
summary(book.lm3)
# 추정회귀식 
# y = 0.72759 x 

# 귀무가설 : 일차 회귀곗의 유의성 검정 
# p-value: 2.141e-07 -> 귀무가설 기각 -> 추정된 회귀계수는 유의하다 
plot(book.lm3)

