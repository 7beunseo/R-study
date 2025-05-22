### 효과 구하는방법
# 주의 - r을 나누지 않는 이유는 tapply를 사용하면 r로 나눈 값이 나오므로 별도로 r을 곱하지 x  

## 주효과일 경우 

# A2 평균 - A1 평균
tapply(y, a, mean)[2] - tapply(y, a, mean)[2] # 반복수도 분모로 기본적으로 들어감

# (3차 상호작용 효과의 대비 반영 합 = CA) / (2 ^ (k-1) * r)
tapply(y, a:b:c, mean) # 3차 상호작용의 평균, 반복수 반영된 평균
cell_means <- c(87, 79, 81, 72, 76, 78, 81, 75) # tapply 결과 
# contrast 계수: A0 조합은 -1, A1 조합은 +1
contrast_a <- c(-1, -1, -1, -1, 1, 1, 1, 1)
# 요인 수 (k = 3 in 2^k 설계)
k <- 3
# A 요인의 주효과 계산
A_effect <- sum(contrast_a * cell_means) / (2^(k - 1))# 나오는 항들을 모두 더해서, 2 ^ (k-2) 로 나눔 

# 대비 제곱합을 이용 
# anova로 SSA를 구함 
SSA <- res$`Sum Sq`[1]
sqrt(SSA * 2 ^ (2 - k) / r)
# 부호가 무조건 양수이므로, 부호 같이 고려해야 함 

## 상호작용일 경우

# AB 상호작용 효과
# 대비 제곱합 이용 
SSAB <- res$`Sum Sq`[4]
SSAB
sqrt(SSAB * 2 ^ (2 - k) / r)

# 대비 합 
cell_means <- c(87, 79, 81, 72, 76, 78, 81, 75) 
c <- c(1, 1, -1, -1, -1, -1, 1, 1)
sum(cell_means * c) / 2 ^ (k -1)

# 3차 상호작용항의 경우 

# 대비제곱합 이용 
SSABC <- res$`Sum Sq`[7]
SSABC
sqrt(SSABC * 2 ^ (2 - k) / r)

# 대비 합 
cell_means <- c(87, 79, 81, 72, 76, 78, 81, 75) # tapply 결과 
c <- c(-1, 1, 1, -1, 1, -1, -1, 1)
sum(cell_means * c) / 2 ^ (k -1)

## 반대로 대비제곱합 구하기 
# SSA 
cell_sums <- tapply(y3, a3:b3:c3, sum)
contrast_a <- c(-1, -1, -1, -1, 1, 1, 1, 1)
SSA <- sum(cell_sums * contrast_a) ^ 2 / (2 ^ (k) * r)
SSA



#####
# 1 #
#####

y1 <- c(9, 11, 11, 13, 12, 14, 14, 18, 14, 16, 14, 20)
a1 <- as.factor(rep(c("A1", "A2", "A3"), each=4))
b1 <- as.factor(rep(rep(c("B1", "B2"), each=2), 3))
data.frame(y1, a1, b1)

# 2
interaction.plot(a1, b1, y1)
interaction.plot(b1, a1, y1)

# 3
tapply(y1, b1, mean)[2] - tapply(y1, b1, mean)[1]

# 4
L1 <- aov(y1~a1*b1)
anova(L1)

# 추가
# 축소모형
anova(aov(y1~a1+b1))


#####
# 2 #
#####
y2 <- c( 3, 8, 9, 10, 14, 16, 4, 7, 9, 15, 19, 20,
         10, 12, 16, 20, 21, 22, 10, 13, 16, 26, 27, 25)
a2 <- as.factor(rep(rep(c("A0", "A1"), each=3), 4))
b2 <- as.factor(rep(c("B0", "B1"), each=12)) 
c2 <- as.factor(rep(rep(c("C0", "C1"), each=6), 2))
data.frame(y2, a2, b2, c2)

# 2
# TSS = SSA + SSB + SSc + SSab + SSac + SSbc + SSabc + SSe

# 3
tapply(y2, a2, mean)
tapply(y2, a2, sd)

# 4
tapply(y2, b2, mean)
tapply(y2, b2, sd)

# 5
tapply(y2, c2, mean)
tapply(y2, c2, sd)

# 6
tapply(y2, b2:c2, mean)
# 12.33333

# 7
tapply(y2, a2:b2:c2, mean)

# 8
L2 <- aov(y2~a2*b2*c2)
anova(L2)

# 9
# H0 : a1 = a2 = 0
# p-value = 7.159e-08
# 귀무가설을 기각한다. 배양액 종류에 따라 차이가 있다.

# 10
# p-value = 5.674e-06
# 귀무가설을 기각한다. 배양액 종류에 따른 차이가 있다.

# 11
# p-value = 0.03059
# 귀무가설을 기각한다. 바이러스 종류에 따른 차이가 있다. 

# 12
# p-value =  0.87635
# 귀무가설을 기각할 수 없다. 배양시간과 바이러스 종류에 따른 상호작용 효과가 없다.

# 13
# p-value = 0.04173
# 귀무가설을 기각한다. 배양액과 바이러스 종류에 따른 상호작용 효과가 있다.


# 14
# p-value = 1.00000    
# 귀무가설을 기각할 수 없다. 세 요인의 3차 상호작용 효과가 있다고 할 수 없다. 

# 15
# 6.67 = MSe

# 16
# a2:c2 제외 모두 유의하지 않음 
anova(aov(y2~a2+b2+c2+a2:c2))


#####
# 3 #
#####
y3 <- c(84, 90, 78, 80, 75, 77, 75, 81,
       80, 82, 70, 74, 80, 82, 74, 76)
a3 <- as.factor(rep(rep(c("A0", "A1"), each=4), 2))
b3 <- as.factor(rep(c("B0", "B1"), each=8))
c3 <- as.factor(rep(rep(c("C0", "C1"), each=2), 4))
data.frame(y3, a3, b3, c3)

# 2
tapply(y3, a3, mean)
tapply(y3, b3, mean)
tapply(y3, c3, mean)

# 3
tapply(y3, a3:b3, mean)
tapply(y3, a3:c3, mean)
tapply(y3, b3:c3, mean)

# 4
# 주효과의 경우 간단하게 수준 1 평균에서 수준 0 평균을 빼면 됨 
tapply(y3, a3, mean)[2] - tapply(y3, a3, mean)[1]
tapply(y3, b3, mean)[2] - tapply(y3, b3, mean)[1]
tapply(y3, c3, mean)[2] - tapply(y3, c3, mean)[1]

# 5
L3 <- aov(y3~a3*b3*c3)
anova(L3)
# 20.25
# 30.25
# 110.25

# 6
model.tables(L3)
model.tables(L3, type="mean")

# 먼저 k, r 선언해주기
k <- 3 # 요인의 개수 
r <- 2 # 반복수 

# 대비 아용 (BC)
contrast_bc <- c(1, -1, -1, 1, 1, -1, -1, 1)
cell_means <- tapply(y3, a3:b3:c3, mean) # 이미 r로 나눈 평균 값이 나옴 
bc_effects <- sum(contrast_bc * cell_means) / 2 ^ (k-1)
bc_effects

# 대비 제곱합 이용 (BC)
res <- anova(L3)
SSBC <- res$`Sum Sq`[6]
sqrt(SSBC * 2 ^ (2 - k) / r) # 부호 없어짐 주의 


# 아래는 이전에 고민한 내용 (틀림 ㅎ)
# 꼭 4로 나눠줘야 함 !! 
# 2^고려하고자 하는 요인 개수 로 나누기 
# 참여하는 조합의 셀 수만큼 나누면 됨 
tapply(y3, a3:b3, mean)
(83.0  - 76.5 - 77.0 + 78.0) / 4 

tapply(y3, a3:c3, mean)
(84.0 - 75.5 - 78.5 + 76.5) / 4

tapply(y3, b3:c3, mean)
(81.5 - 78.5 - 81.0 + 73.5) / 4 # 분모 8r 중 2r이 분모로 들어간 상황이라 2로 나눠주었어야 함 

# 7
# 56.25
# 42.25 
# 20.25 

# 8
tapply(y3, a3:b3:c3, mean)
(87 - 79 - 81 + 72 - 76 + 78 + 81 +- 75)/8 # 0.875
# mean 변수, contrast 변수로 만들어서 곱해서 sum 하면 더 깔끔함! 2 ^ (k-1)로 나누어주면 됨, r 나누는 거 아님 
cell_means <- tapply(y3, a3:b3:c3, mean)
contrast_abc <- c(-1, 1, 1, -1, 1, -1, -1, 1)
sum(cell_means * contrast_abc) / 2 ^ (k-1)

# 9
# 12.25

# 10
anova(L3)
# 달걀 분말의 처리만 유효하고, 나머지 요인은 유의하지 않음 

# 11
# 글리세롤과 달걀분말, 3차 상호작용효과가 유의하지 않음 
anova(aov(y3~a3+b3+c3+a3:b3+a3:c3))


#####
# 4 #
#####

y4 <- c(
  580, 568, 570,
  550, 538, 570,
  540, 570, 599,
  1090, 1087, 1085,
  1070, 1037, 1025,
  1045, 1053, 1066,
  1392, 1380, 1386,
  1386, 1328, 1312,
  900, 904, 880
)

A4 <- as.factor(rep(c(1, 2, 3), each=9))
B4 <- as.factor(rep(rep(c(100, 125, 150), each=3), 3))

data.frame(y4, A4, B4)

# 2
interaction.plot(A4, B4, y4)

# 3
interaction.plot(B4, A4, y4)

# 4
plot(y4~A4) # 차이가 있어보임

# 5
plot(y4~B4) # 차이가 없어보임 

# 6
tapply(y4, B4, mean)

# 7
tapply(y4, A4, mean)

# 8
tapply(y4, A4:B4, mean)

# 9
L4 <- aov(y4~A4*B4)
anova(L4)

# 10
# 있음

# 11
# 있음

# 12
# 있음

# 13
plot(L4)


#####
# 5 #
#####

y5 <- c(
  305, 302, 335, 337, 366, 364, 372, 374, 376, 373, 348, 350,
  322, 325, 350, 348, 326, 324, 330, 330, 327, 330, 310, 308,
  320, 322, 342, 344, 328, 336, 338, 330, 350, 345, 330, 325
)
A5 <- as.factor(rep(1:3, each=12))
B5 <- as.factor(rep(rep(1:6, each=2), 3))

data.frame(y5, A5, B5)

L5 <- aov(y5~A5*B5)
anova(L5)

