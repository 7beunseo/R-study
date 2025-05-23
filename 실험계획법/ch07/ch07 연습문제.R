#####
# 1 #
#####

y1 <- c(0, 2, 4, 8, 4, 6, 8, 10)
a1 <- as.factor(rep(rep(c("A1", "A2"), each=2), 2))
b1 <- as.factor(rep(c("B1", "B2"), each=4))                    
data.frame(y1, a1, b1)

# 2
tapply(y1, a1, mean)
tapply(y1, a1, sd)

tapply(y1, b1, mean)
tapply(y1, b1, sd)

# 3
interaction.plot(a1, b1, y1)
interaction.plot(b1, a1, y1)

# 4
# 요인 A에 대한 주효과
ma <- tapply(y1, a1, mean)
ma[2] - ma[1]
# 4.5

# 요인 B에 대한 주효과
mb <- tapply(y1, b1, mean)
mb[2] - mb[1]
# 3.5

# 5
# AB 상호작용 효과
sum_v <- tapply(y1, a1:b1, sum)
sum_v
ab_contrast <- c(1, -1, -1, 1)
k <- 2
r <- 2
sum(sum_v * ab_contrast) / 2 ^ (k-1) / r
# -0.5

# 6
# 분산분석을 이용해서 처리제곱합 구하기 
L1 <- aov(y1~a1*b1)
summary(L1)
# SSA = 40.5
# sSB = 24.5

#  직접 구해보기
a_contrast <- c(-1, -1, 1, 1)
SSA <- sum(sum_v * a_contrast) ^ 2 / 2 ^ k / r
b_contrast <- c(-1, 1, -1, 1)
SSB <- sum(sum_v * b_contrast) ^ 2 / 2 ^ k / r

# 7
# 0.5 
SSAB <- sum(sum_v * ab_contrast) ^ 2 / 2 ^ k / r

# 8
summary(L1)

# 9
# A의 수준에 대한 효과가 유의하다.
# 나머지는 귀무가설 기각할 수 없다. 

# 10
model.tables(L1)

# 11
predict(L1)
# 순서 확인 방법
model.frame(L1)

# 12
L1$residuals
y1 - predict(L1) # 동일함, 실제 값 - 예측 값  

# 13
# 3.5


#####
# 2 #
#####

y2 <- c(35, 39, 67, 66, 101, 95, 34, 31)
a2 <- as.factor(rep(c(0, 1), each=4))
b2 <- as.factor(rep(rep(c(0, 1), each=2), 2))
data.frame(y2, a2, b2)
k2 <- 2
r2 <- 2

# 2
tapply(y2, a2, mean)
tapply(y2, b2, mean)

tapply(y2, a2, sd)
tapply(y2, b2, sd)

# 3
interaction.plot(a2, b2, y2)
interaction.plot(b2, a2, y2)
# 상호작용 효과가 있어보인다.
# A가 0수준일 때 B1가 B0보다 높고, A가 1수준일 때 B0이 B1보다 높다.
# 상호작용 그래프가 교차함 ! 

# 4 # 5
# 수준 평균 차 
ma2 <- tapply(y2, a2, mean)
ma2[2] - ma2[1]

mb2 <- tapply(y2, b2, mean)
mb2[2] - mb2[1]

# 계수표 이용
sum_v2 <- tapply(y2, a2:b2, sum)
sum_v2
a_contrast <- c(-1 ,-1 ,1, 1)
b_contrast <- c(-1, 1, -1, 1)

sum(sum_v2 * a_contrast) / 2 ^ (k2 - 1) / r2
sum(sum_v2 * b_contrast) / 2 ^ (k2 - 1) / r2

# 6
ab_constrast <- c(1, -1, -1, 1)
sum(sum_v2 * ab_constrast) / 2 ^ (k2 -1) / r2
# 확인
sqrt(4512 * 2 ^ (2 - k2) / r2)

# 7
L2 <- aov(y2~a2*b2)
summary(L2)
# 모든 효과가 유의함. 

# 9
model.tables(L2)


#####
# 3 #
#####

y3 <- c(
  21, 23, 25, 25, 27, 29,
  37, 38, 39, 31, 34, 37,
  20, 22, 24, 22, 24, 26,
  35, 37, 39, 39, 40, 41
)
a3 <- as.factor(rep(rep(c("A0", "A1"), each=6), 2))
b3 <- as.factor(rep(c("B0", "B1"), each=12))
c3 <- as.factor(rep(rep(c("C0", "C1"), each=3), 4))
data.frame(y3, a3, b3, c3)
k3 <- 3
r3 <- 3

# 2
tapply(y3, a3, mean)
tapply(y3, b3, mean)
tapply(y3, c3, mean)

# 3
interaction.plot(a3, b3, y3)
interaction.plot(a3, c3, y3)
interaction.plot(b3, c3, y3)
# 상호작용이 있어 보인다. 

# 4
ma3 <- tapply(y3, a3, mean)
ma3[2] - ma3[1]
# 계수표를 이용
a_contrast <- rep(c(-1, 1), each=4)
sum(a_contrast * sum_v3) / 2 ^ (k3 - 1) / r3
# 13.25

# 5
mb3 <- tapply(y3, b3, mean)
mb3[2] - mc3[1]
# 0.75

# 6
mc3 <- tapply(y3, c3, mean)
mc3[2] - mc3[1]
# 1.25

# 7
sum_v3 <- tapply(y3, a3:b3:c3, sum) # sum으로 넣어야 함 주의!! 
sum_v3

ab_contrast <- c(1, 1, -1, -1, -1, -1, 1, 1)
sum(ab_constrast * sum_v3) / 2 ^ (k3 - 1) / r3
# 1.25

# 8
ac_contrast <- c(1, -1, 1, -1, -1, 1, -1, 1)
sum(ac_contrast * sum_v3) / 2 ^ (k3 - 1) / r3
# -1.75

# 9
bc_contrast <- c(1, -1, -1, 1, 1, -1, -1, 1)
sum(bc_contrast * sum_v3) / 2 ^ (k3 - 1) / r3
# 1.25

# 10
abc_contrast <- c(-1, 1, 1, -1, 1, -1, -1, 1)
sum(abc_contrast * sum_v3) / 2 ^ (k3 - 1) / r3
# 2.25

# 11
L3 <- aov(y3~a3*b3*c3)
anova(L3)
# 주효과 중 a3 유의함 
# 상호작용 중 a3:b3 a3:c3 a3:b3:c3 유의함 

# 13
L3_small <- aov(y3~a3+b3+c3+a3:b3+a3:c3+a3:b3:c3)
summary(L3_small)


#####
# 4 #
#####

k4 <- 2
r4 <- 4 # 반복 잘 넣기 
y4 <- c(28, 25, 27, 29,
       36, 32, 34, 35,
       18, 19, 23, 20,
       31, 30, 29, 32)
a4 <- as.factor(rep(rep(0:1, each=4), 2))
b4 <- as.factor(rep(0:1, each=8))
data.frame(y4, a4, b4)

# 2
tapply(y4, a4, mean)
tapply(y4, b4, mean)

# 3
plot(y4~a4) # 차이가 있어보임 
plot(y4~b4) # 약간의 차이? 

# 4
interaction.plot(a4, b4, y4)

# 5
ma4 <- tapply(y4, a4, mean)
ma4[2] - ma4[1]
# 8.75

# 6
mb4 <- tapply(y4, b4, mean)
mb4[2] - mb4[1]
# -5.5
# 대비를 이용해 구하기
b_contrast_4 <- c(-1, 1, -1, 1)
sum(sum_v4 * b_contrast_4) / 2 ^ (k4 - 1) / r4

# 7
sum_v4 <- tapply(y4, a4:b4, sum)
sum_v4
ab_constrast_4 <- c(1, -1, -1, 1)
sum(sum_v4 * ab_constrast) / 2 ^ (k4 - 1) / r4
# 1.75

# 8
L4 <- aov(y4~a4*b4)
anova(L4)
# 주효과만 유의함 

# 10
model.tables(L4)


#####
# 5 #
#####

y5 <- c(
  11,  9, 10, 10, 11, 10,  8,
  15, 10, 16, 14, 12,  9,  6,
  9, 12, 11, 11, 11, 12,  9,
  16, 17, 15, 15, 16, 17, 14,
  10, 9, 8, 9, 11, 10, 10,
  12, 14, 15, 14, 13, 13, 12,
  10, 12, 14, 10, 8, 7, 9,
  15, 16, 12, 13, 12, 9, 14
)
# length(y5)

a5 <- as.factor(rep(c(0, 1, 0, 1, 0, 1, 0, 1), each=7))
b5 <- as.factor(rep(rep(c(0, 0, 1, 1), 2), each=7))
c5 <- as.factor(rep(rep(c(0, 1), each=4), each=7))
data.frame(y5, a5, b5, c5)
k5 <- 3
r5 <- 7

# 2
tapply(y5, a5, mean)
tapply(y5, b5, mean)
tapply(y5, c5, mean)

# 3
plot(y5~a5)
plot(y5~b5)
plot(y5~c5)

#4
ma5 <- tapply(y5, a5, mean)
ma5[2] - ma5[1]
# 3.392857 

# 대비를 통해 a의 주효과 구하기
sum_v5 <- tapply(y5, a5:b5:c5, sum)
sum_v5
a_contrast_5 <- rep(c(-1,1), each=4)
sum(a_contrast_5 * sum_v5) / 2 ^ (k5 - 1) / r5

mb5 <- tapply(y5, b5, mean)
mb5[2] - mb5[1]
# 1.25

mc5 <- tapply(y5, c5, mean)
mc5[2] - mc5[1]
# -0.5357143 

# 5
ab_contrast_5 <- c(1, 1, -1, -1, -1, -1, 1, 1)
sum(ab_contrast_5 * sum_v5) / 2 ^ (k5 - 1) / r5
# 0.6071429

ac_contrast_5 <- c(1, -1, 1, -1, -1, 1, -1, 1)
sum(ac_contrast_5 * sum_v5) / 2 ^ (k5 - 1) / r5
# -0.03571429

bc_contrast_5 <- c(1, -1, -1, 1, 1, -1, -1, 1)
sum(bc_contrast_5 * sum_v5) / 2 ^ (k5 - 1) / r5
# -1.178571

# 6
L5 <- aov(y5~a5*b5*c5)
anova(L5)
# a5 b5 유의
# b5:c5 유의 

# 8
L5_small <- aov(y5~a5+b5+c5+b5:c5)
anova(L5_small)


#####
# 6 #
#####

y6 <- c(
  1595, 1745, 1835, 1838, 1573, 2185, 1700, 1717,
  1578, 1689, 1823, 1614, 1592, 1685, 1815, 1814
)
a6 <- as.factor(rep(rep(c("A1", "A2"), each=4), 2))
b6 <- as.factor(rep(rep(c("B1", "B2"), each=2), 4))
c6  <- as.factor(rep(rep(c("C1", "C2")), 8))
data.frame(y6, a6, b6, c6)
k6 <- 3
r6 <- 2

# 2
tapply(y6, a6, mean)
tapply(y6, b6, mean)
tapply(y6, c6, mean)

# 3
interaction.plot(a6, b6, y6)

# 4
ma6 <- tapply(y6, a6, mean)
ma6[2] - ma6[1]
# 45.5

# 대비를 이용
sum_v6 <- tapply(y6, a6:b6:c6, sum)
a_contrast_6 <- rep(c(-1, 1), each=4)
sum(a_contrast_6 * sum_v6) / 2^(k6 - 1) / r6

mb6 <- tapply(y6, b6, mean)
mb6[2] - mb6[1]
# 64.25

mc6 <- tapply(y6, c6, mean)
mc6[2] - mc6[1]
# 97 

# 5
ab_contrast_6 <- rep(c(-1, 1), each=4)
sum(ab_contrast_6 * sum_v6) / 2^(k6 - 1) / r6
# 45.5

ac_contrast_6 <- c(1, -1, 1, -1, -1, 1, -1, 1)
sum(ac_contrast_6 * sum_v6) / 2^(k6 - 1) / r6
83.25

bc_contrast_6 <- c(1, 1, -1, -1, -1, -1, 1, 1)
sum(bc_contrast_6 * sum_v6) / 2^(k6 - 1) / r6
# -61.5

# 6
L6 <- aov(y6~a6*b6*c6)
anova(L6)

# 9
model.tables(L6)


#####
# 7 #
#####

y7 <- c(50, 70, 48, 58, 43, 65, 60, 90, 78, 76, 75, 65, 86, 55, 50, 96)
a7 <- as.factor(c(rep(c(0, 1), 8)))
b7 <- as.factor(c(rep(c(0, 0, 1, 1), 4)))
c7 <- as.factor(c(rep(c(0, 0, 0, 0, 1, 1, 1, 1), 2)))
d7 <- as.factor(c(rep(c(0, 1), each=8)))
data.frame(y7, a7, b7, c7, d7)

# 2
L7 <- aov(y7 ~ a7 + b7 + c7 + d7 
          + a7:b7 + a7:c7 + a7:d7 
          + b7:c7 + b7:d7 + c7:d7 
          + a7:b7:c7 + a7:b7:d7 + a7:c7:d7 + b7:c7:d7 )

summary(L7)

# 상호작용 효과와 쥬효과가 모두 유효하지 않다.

# 3
L7 <- aov(y7 ~ a7 + b7 + c7 + d7)
summary(L7)


#####
# 8 #
#####

y8 <- c(
  1595, 1745, 1835, 1838, 1573, 2185, 1700, 1717,
  1578, 1689, 1823, 1918, 1592, 1685, 1815, 1814,
  1895, 2145, 1670, 2138, 1763, 1835, 1700, 1957,
  1578, 1789, 1725, 1914, 1700, 1785, 1815, 1922
)
a8 <- as.factor(rep(rep(c(0, 1), each=8), 2))
b8 <- as.factor(rep(rep(c(0, 1), each=4), 4))
c8 <- as.factor(rep(rep(c(0, 1), each=2), 8))
d8 <- as.factor(rep(c(0, 1), each=16))
data.frame(y8, a8, b8, c8, d8)
k8 <- 4
r8 <- 2

# 2
tapply(y8, a8, mean)
tapply(y8, b8, mean)
tapply(y8, c8, mean)
tapply(y8, d8, mean)

# 3
interaction.plot(a8, b8, y8)
interaction.plot(a8, c8, y8)
interaction.plot(a8, d8, y8)
# 상호작용 효과가 있어보인다.
interaction.plot(b8, c8, y8)
interaction.plot(b8, d8, y8)
interaction.plot(c8, d8, y8)
# 상호작용 효과가 없어보일지도..? 

# 4
ma8 <- tapply(y8, a8, mean)
ma8[2] - ma8[1]
# 71.8125
mb8 <- tapply(y8, b8, mean)
mb8[2] - mb8[1]
# 19.8125
mc8 <- tapply(y8, c8, mean)
mc8[2] - mc8[1]
# 73.0625 
md8 <- tapply(y8, d8, mean)
md8[2] - md8[1]
# 76.8125

# 대비를 이용
sum_v8 <- tapply(y8, a8:b8:c8:d8, sum)
sum_v8
contrast_a8 <- rep(c(-1,1), each=8)
sum(sum_v8 * contrast_a8) / 2 ^ (k8 - 1) / r8
# -71.8125

# 5
L8 <- aov(y8~a8*b8*c8*d8)
anova(L8)
# 모든 효과가 유의하지 않음

# 6
L8_small <- aov(y8~a8+b8+c8+d8)
anova(L8_small)
# 모든 주효과도 유의하지 않음

# 상자그림..
plot(y8~a8)
plot(y8~b8)
plot(y8~c8)
plot(y8~d8)


######
# 14 #
######

y14 <- c(
  2, 3, -7, -2,
  -3, 8, -6, 0,
  -2, -6, -1, -4,
  -5, 4, 0, -2,
  0, 1, 0, -1,
  1, 1, -6, 2,
  9, -3, 0, -4,
  0, -3, 2, -1
)
a14 <- as.factor(c(0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 0))
b14 <- as.factor(c(0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1))
c14 <- as.factor(c(0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1))
data.frame(y14, a14, b14, c14)

L14 <- aov(y14~a14*b14*c14)
summary(L14)
# b, c 수준에 따른 효과가 유의함 

L4_small <- aov(y14~a14+b14+c14)
summary(L4_small)

interaction.plot(a14, b14, y14)        
interaction.plot(a14, c14, y14)        
interaction.plot(b14, c14, y14)        
