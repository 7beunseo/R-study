#####
# 1 #
#####

y = c(2.4, 2.7, 3.1, 3.1, 0.7, 1.6, 1.7, 1.8, 2.4, 3.1, 
      5.4, 6.1, 0.3, 0.3, 2.4, 2.7, 0.5, 0.9, 1.4, 2.0)

group <- as.factor(rep(1:5, each=4))

data.frame(y, group)

# 평균차가 있는가?
boxplot(y~group)

# 분산분석 
aov1 <- aov(y~group)
summ.aov1 <- summary(aov1)

# p-value 직접 구하기 
1 - pf(5.966, 4, 15)

tapply(y, group, mean)

# LSD 
pairwise.t.test(y, group, p.adjust="none") # (5, 4, 2) (1, 3)
# 0.05 미만인 값들 형광펜 칠하기
# 이 값들이 연결되지 않도록 그룹화를 해야 함 
# 0.05보다 작아야  하니까 소숫점 첫째 자리가 0인 숫자들만 보자! 실수하지 말기 

# LSD 직접
t <- qt(0.975, 15)
mse = summ.aov1[[1]]$`Mean Sq`[2]
se <- sqrt(2 * mse / 4)

lsd <- t * se
lsd

m <- tapply(y, group, mean)
m[1] - m[2] 
m[1] - m[3]
m[1] - m[4]
m[1] - m[5] # 차이 있음 
m[2] - m[3] # 차이 있음 
m[2] - m[4]
m[2] - m[5]
m[3] - m[4] # 차이 있음 
m[3] - m[5] # 차이 있음 
m[4] - m[5]

# bonferroni
pairwise.t.test(y, group, p.adjust="bonferroni", pool.sd=T)
pairwise.t.test(y, group, p.adjust="bonferroni", pool.sd=F)

# Tukey
a.tukey <- TukeyHSD(aov1, ordered=T)
plot(a.tukey)

# agricolae
install.packages("agricolae")
library(agricolae)

(LSD.test(aov1, "group", p.adj="none")) # LSD 
(LSD.test(aov1, "group", p.adj="bonferroni")) # Bonferrnoi 

# scheffe
(scheffe.test(aov1, "group", group=T))

########
# 대비 #
########

# 대비 생성하기 (1:1 대비인 경우)
contr.treatment(5, base=1, contrasts=T) # 처리 개수, 얼마를 기준으로 할 것인가? 
contr.treatment(5, base=4, contrasts=T) # 4개의 처리 수준 개수가 있을 때, 각각의 처리와 처리 4를 비교함
# 만약 결과가 유의하다면, 두 수준 간 평균 차이가 유의한 것 ! 

# group에 대비 등록 
contrasts(group) <- contr.treatment(5, base=4, contrasts=T) # group 4와 평균 비교 

# 분산분석 실시 
summary.lm(aov(y~group)) # 4와 3의 평균 차가 유의하다. 
model.tables(aov1)

# 처리제곱합을 직교다항대비로 분해 
contr.poly(levels(group)) # 직교 다항대비로 분해 
round(contr.poly(levels(group)), 2)

contrasts(group) <- contr.poly(levels(group)) # 마지막 대비가 유의함 

summary.lm(aov(y~group))

# 원하는 직교대비 진행 
contrastmatrix = cbind( c(-2, -1, 0, 1, 2),
                        c(2, -1, -2, -1, -2),
                        c(-1, 2, 0, -2, 1),
                        c(1, -4, 6, -4, 1)
)
# 단 위에 직교대비 아님 ㅎ..
contrastmatrix %*% t(contrastmatrix) # 대각행렬이 아님 
# transpose 한 애를 곱해서 대각행렬이 나오는지 확인

contrasts(group) <- contrastmatrix
summary.lm(aov(y~group))

# 구체적인 가설에 대한 f 검정 (대비 하나, 자유도 1임)
k <- 5 # 처리 수준 수
N <- length(y) # 데이터 총 개수 
m <- tapply(y, group, mean) # 처리 평균 
n <- tapply(y, group, length) # 반복수 
summ.aov <- summary(aov(y~group))
mse <- summ.aov[[1]]$`Mean Sq`[2] # 분산의 추정값 
c1 <- c(2, 2, 2, -3, -3)
f <- (sum(c1 * m))^2 / (mse * sum(c1^2 / n))
f
1 - pf(f, 1, N-k)

# 교재 코드
N = length(y)
k = 5
m = tapply(y, group, mean)
ni = tapply(y, group, length)
c1 = c(2,2,2,-3,-3)
summ.aov = summary(aov1)
mse = summ.aov[[1]]$`Mean Sq`[2]
f = sum(c1*m)^2 / (mse*sum(c1^2/ni))
1 - pf(f, 1, N-k)

## 분석할 점

# 직교 대비를 진행 (contrastmatrix)
# 각각의 sst의 합이 전체 sst와 같은지 확인 -> mse 제외이기 때문에 mse 필요 없음 
# 이후 각각의 sst를 합한 후 k-1(자유도)로 나누면 MSt와 동일한지 확인 
N = length(y)
k = 5
m = tapply(y, group, mean)
ni = tapply(y, group, length)

sst_list <- rep(0, k-1)

# 처리 수준이 5개인 경우
C1 <- c(-2, -1, 0, 1, 2)      # Linear
C2 <- c(2, -1, -2, -1, 2)     # Quadratic
C3 <- c(-1, 2, 0, -2, 1)      # Cubic
C4 <- c(-1, 1, 2, 1, -1)      # Quartic

contrastmatrix <- cbind(C1, C2, C3, C4)

for(i in 1:(k-1)) { # 직교대비 개수만큼 반복 
  c <- contrastmatrix[,i] # 전체 행을 가져옴 
  sst_list[i] = sum(c*m)^2 / sum(c^2/ni)
}

sum(sst_list)

summ.aov


## 잘 안 돼서 과제 문제로 변경
data = c(55, 55, 57, 54, 54, 56, 60, 61, 60, 60, 60, 60,
         70, 72, 73, 68, 77, 77, 72, 72, 72, 70, 68, 60)


age <- as.factor(rep(c(10, 30, 50, 70), each=6))

N = length(data)
k = 4
m = tapply(data, age, mean) # 변수명 중복 주의!! 
ni = tapply(data, age, length)

cmatrix <- cbind(c(-3, -1, 1, 3), c(1, -1, -1, 1), c(-1, 3, -3, 1))
t(cmatrix) %*% cmatrix # 직교대비인지 확인 

sst_list <- 0 # sst_list나 sst_sum 한 개만 하기 
for(i in 1:(k-1)) { # 직교대비 개수만큼 반복 
  c <- cmatrix[,i] # 전체 행을 가져옴 
  sst_list[i] = sum(c*m)^2 / sum(c^2/ni) # mse 제외한 식 
}

sum(sst_list)
sst_list
summary(aov(data~age))

# 조심해야 할 것
# m과 같이 같은 변수를 덮어씌웠는지 확인
# 변수 확인
# sum이 이상하면 전체 들어간 내용 출력해보기 


#####
# 2 #
#####

# 두 번째 분석

color = as.factor(c(rep("Brown",8),rep("Green", 5),rep("Blue",6))) # 불균형자료인 경우 rep으로 하나하나 넣어줘야 함 
levels(color)

Flicker = c(26.8, 27.9, 23.7, 25, 26.3, 24.8, 25.7, 24.5, 26.4, 
            24.2, 28, 26.9, 29.1, 25.7, 27.2, 29.9, 28.5, 29.4, 28.3) 
# 균형 자료가 아님! 

# 상자그림 그리기 
boxplot(Flicker~color)

# 처리 평균
tapply(Flicker, color, mean)
# 처리 효과
tapply(Flicker, color, mean) - mean(Flicker)

# 분산분석
aov2 <- aov(Flicker~color)
summary(aov2)
summ.aov2 <- summary(aov2)
mse = summ.aov2[[1]]$`Mean Sq`[2]
mse # 분산의 추정값


# f 통계량으로 p-value 구하기
1 - pf(4.802, 2, 16)
# 기각역 구하기
qf(0.95, 2, 16)

# 회귀분석
summary.lm(aov2)
# 처리효과
model.tables(aov2)
# 처리 평균
model.tables(aov2, type="mean")
predict(aov2)

# 잔차
Flicker - predict(aov2)
Flicker - aov2$fitted
aov2$residuals

# 잔차 그림
plot(aov2)

# LSD
pairwise.t.test(Flicker, color, p.adjust="none")

# bonferroni
pairwise.t.test(Flicker, color, p.adjust="bonferroni")

# HSD
TukeyHSD(aov2)


#####
# 3 #
#####

display <- as.factor(rep(c("text", "color", "image"), each=5))
y = c( 5.43, 5.71, 6.22, 6.01, 5.29, 
       6.24, 6.24, 5.98, 5.66, 6.60,
       8.79, 9.20, 7.90, 8.15, 7.55)
data.frame(y, display)

# 상자그림 그리기
boxplot(y~display)

# 처리평균
tapply(y, display, mean)
# 처리효과 
tapply(y, display, mean) - mean(y)

# 분산분석
aov3 <- aov(y~display)
summary(aov3)
summ.aov3 <- summary(aov3)
mse <- summ.aov3[[1]]$`Mean Sq`[2]
mse

# f -> p-value
1 - pf(40.17, 2, 12)
# 기각역
qf(0.95, 2, 12)

# 회귀분석
summary.lm(aov3)
summary.lm(y~display)
summary(lm(y~display))

plot(aov3)

# LSD
pairwise.t.test(y, display, p.adjust="none")

# 직접 계산 
t <- qt(0.975, 12)
se <- sqrt(2 * mse / 5)
lsd <- t * se
lsd

m <- tapply(y, display, mean)
m[1] - m[2] # 차이 있음 
m[1] - m[3]
m[2] - m[3] # 차이 있음 


##### 등분산성 확인을 위한 레빈 검정
install.packages("car")  # 처음 한 번만 설치
library(car)
leveneTest(data ~ age)