#####
# 1 #
#####


y = c(20, 22, 18, 25,
      16, 18, 17, 19,
      30, 34, 29, 27)
trt <- as.factor(rep(1:3,each=4))
block <- as.factor(rep(1:4, 3))

# 1

summ.aov <- summary(aov(y~block+trt))

mse = summ.aov[[1]]$`Mean Sq`[3]
mse

lsd <- qt(0.975, 5) * sqrt((2 * mse) / 4)
lsd


# 처리별 평균 (bar(yi))
tapply(y, trt, mean)
# 블록별 평균
tapply(y, block, mean)

# 처리효과
tapply(y, trt, mean) - mean(y)
# 블록효과 
tapply(y, block, mean) - mean(y)

# 분산분석 
aov.out <- aov(y~trt+block)
summary(aov.out)

ft = summ.aov[[1]]$`F value`[2]
# p-value 구하기
1 - pf(ft, 2, 6)
# 기각역 구하기
qf(0.95, 2, 6)

# 분산 = MSe
mse

# 상자그림 그리기 
plot(y~trt)
plot(y~block)

# LSD
pairwise.t.test(y, trt, p.adjust="none")

# LSD 값 직접 구하기 
mse = summ.aov[[1]]$`Mean Sq`[3]
t <- qt(0.975, 6) # 주의 t 분포이고, 자유도는 오차자유도를 사용함 
se <- sqrt(2 * mse / 4) # 블록 개수로 나눔
lsd <- t * se

m <- tapply(y, trt, mean)
m[1] - m[2]
m[2] - m[3]
m[1] - m[3]

# 적합값 출력
aov.out$fitted

# 잔차 출력
aov.out$residuals

# 정규분포 따르는지 확인
shapiro.test(aov.out$residuals)

# 잔차 그림
plot(aov.out)


#####
# 2 #
#####


y = c(13, 17, 13, 14, 16, 11, 12, 11, 12, 14, 17, 19, 18, 20, 20)
trt <- as.factor(rep(1:3, each=5))
block <- as.factor(rep(1:5, 3))
data.frame(y, block, trt)

# 상자그림 그리기
# 처리별 상자그림
plot(y~trt)
# 블록별 상자그림 
plot(y~block)

# 모수 추정
# 처리별 평균
tapply(y, trt, mean)
# 블록별 평균
tapply(y, block, mean)
# hat tau 처리효과 
tapply(y, trt, mean) - mean(y)
# hat block 블록효과 
tapply(y, block, mean) - mean(y)
# 전체 평균 추정
mean(y)

# 분산분석
aov.out <- aov(y~trt+block)
summ.aov <- summary(aov.out)

# 추정한 분산
mse = summ.aov[[1]]$`Mean Sq`[3]
mse

# 블록 f-value 구해보기
mse = summ.aov[[1]]$`Mean Sq`[3]
mse
msb = summ.aov[[1]]$`Mean Sq`[2]
msb
msb / mse
# 블록 p-value 구해보기
1 - pf(msb/mse, 4, 8)

# LSD
pairwise.t.test(y, trt, p.adjust="none")

# 직접 LSD
t <- qt(0.975, 8) # 0.975, 오차 자유도 넣기 
se <- sqrt((2 * mse) / 5)
lsd <- t * se
lsd

m <- tapply(y, trt, mean)
m[1] - m[2]
m[2] - m[3]
m[1] - m[3]


#####
# 3 #
#####

# 균형불완비블록화설계
y = c(17, 13, 16,
      11, 11, 12,
      10, 11, 12,
      12, 14, 13)
additive = as.factor(rep(1:4,each=3))
car = as.factor( c(2,3,4, 1, 3, 4, 1, 2, 4, 1, 2, 3) )

plot(y~trt)
plot(y~block)

fit = lm(y~car+additive)
anova(fit)

# 잔차 출력 예시 
aov.out
aov.out$residuals # 잔차 
y - predict(aov.out) # 잔차 
y - aov.out$fitted # 잔차 


################
# 연습문제 1번 #
################

# 완전화률화 블록 설계 
y <- c(
  15, 20, 13, 16,  # 1행 (블록 1)
  11, 20, 15, 18,  # 2행 (블록 2)
  10, 22, 17, 15,  # 3행 (블록 3)
  12, 19, 13, 17   # 4행 (블록 4)
)

trt <- as.factor(rep(1:4, 4))
block <- as.factor(rep(1:4, each=4))

# 평균, 표준편차 구하기 
tapply(y, trt, mean)
tapply(y, trt, sd)

tapply(y, block, mean)
tapply(y, block, sd)

# 상자그림 그리기 
boxplot(y~trt)
boxplot(y~block)

aov1 <- aov(y~trt+block)
summ.aov <- summary(aov1)

# LSD
pairwise.t.test(y, trt, p.adjust="none")

# LSD 직접 구하기 
t <- qt(0.975, 9)
mse = summ.aov[[1]]$`Mean Sq`[3]
mse
se <- sqrt(2 * mse / 4)
lsd <- t * se
lsd

m <- tapply(y, trt, mean)
m[1] - m[2]
m[1] - m[3] # 차이 없음 
m[1] - m[4]
m[2] - m[3]
m[2] - m[4]
m[3] - m[4] # 차이 없음 


################
# 연습문제 2번 #
################

y <- c(
  175,  95, 180, 170, 155,   # 1행 (실험일 1)
  190, 185, 180, 200, 190,   # 2행 (실험일 2)
  185, 165, 175, 195, 200    # 3행 (실험일 3)
)
trt <- as.factor(rep(1:5, 3))
block <- as.factor(rep(1:3, each=5))

data.frame(y,  trt, block)

aov1 <- aov(y~trt+block)
summary(aov1)

# LSD
pairwise.t.test(y, trt, p.adjust="none")



################
# 연습문제 4번 #
################

y <- c(
  10, 7, 5, 6,   # 처리 1
  6, 6, 3, 4,    # 처리 2
  6, 6, 4, 3,    # 처리 3
  6, 1, 2, 2,    # 처리 4
  7, 6, 5, 5     # 처리 5
)

trt <- as.factor(rep(c(1, 1.5, 2, 2.5), 5))
block <- as.factor(rep(1:5, each=4))
data.frame(y, trt, block)

# 평균과 표준편차 (처리)
tapply(y, trt, mean)
tapply(y. trt, sd)

# 상자그림
plot(y~trt)

# 분산분석
aov4 <- aov(y~trt+block)
summ.aov4 <- summary(aov4)

1 - pf(10.286, 3, 12)
1 - pf(9.286, 4, 12)

# LSD
pairwise.t.test(y, trt, p.adjust="none")

# 직접 구하기
mse = summ.aov4[[1]]$`Mean Sq`[3]
mse
summ.aov4
t <- qt(0.975, 12)
se <- sqrt(2 * mse / 5)
lsd <- t * se
lsd

m <- tapply(y, trt, mean)
m[1] - m[2] # 차이 없음 
m[1] - m[3] 
m[1] - m[4]
m[2] - m[3] # 차이 없음 
m[2] - m[4] # 차이 없음 
m[3] - m[4] # 차이 없음 


################
# 연습문제 6번 #
################

y6 <- c(
  5.47, 5.31, 5.46, 5.55, 5.93,
  5.97, 6.32, 6.02, 5.87, 5.58,   # 왼쪽 열
  
  5.13, 5.46, 5.54, 5.54, 6.00,
  5.99, 6.43, 6.13, 5.87, 5.60    # 오른쪽 열
)

trt6 <- as.factor(rep(1:2, each=10))
block6 <- as.factor(rep(1:10, 2))

data.frame(y6, trt6, block6)                    

# 평균과 표준편차
tapply(y6, trt6, mean)
tapply(y6, trt6, sd)

# 상자그림
boxplot(y6~trt6)
boxplot(y6~block6)

# 분산분석
aov6 <- aov(y6~trt6+block6)
summary(aov6)