## 반복이 없는 경우, 통계적 모형 abij 포함하지 않음 

y1 <- c(9, 13, 14, 20) # 접착제의 강도, 순서 잘 넣기 중요!! 
a1 <- as.factor(c(100, 100, 150, 150)) # 압력 
b1 <- as.factor(c(50, 100, 50, 100)) # 온도 
data.frame(y1, a1, b1)

plot(y1~a1)
plot(y1~b1)
# 두 상자그림 모두 온도, 압력에 따라 접착제의 강도가 달라지는 것처럼보임 ! 

interaction.plot(a1, b1, y1) # 	압력을 기준으로 온도별 접착 강도 비교, 온도가 고정되어있을 때 압력에 따라 어떻게 보이는가? 
interaction.plot(b1, a1, y1)

# 분산분석표
# 반복이 1회 -> 상호작용효과 없음 
L1 <- aov(y1~a1+b1)
summary(L1)
# H0 : a0 = a1 = 0, p-value = 0.105 귀무가설 기각하지 못함. 압력 수준 간 차이가 있다고 할 수 없음 
# H0 : b0 = b1 = 0, p-value = 0.126 귀무가설 기각하지 못함. 온도 수준 간 차이가 있다고 할 수 없음. 

### 주의!! 2^k 요인설계 수준 0부터 시작함 !! 통계적 모형 인덱스도 0, 1만 써주고, 요인에 대한 귀무가설 쓸 때도 a0, a1 으로 써야 함 !! 


## 반복이 있는 경우 -> 상호작용 효과가 있음, 통계적 모형 ab 상호작용 효과 포함함 
y2 = c(9, 11, 14, 16, 11, 13, 14, 20)
b2 <- as.factor(rep(c(50, 100), each=4))
a2 <- as.factor(rep(rep(c(100, 150), each=2), 2))
data.frame(y2, a2, b2)

# 분산분석
# 상호작용 효과까지 입력
L2 <- aov(y2~a2*b2)
summary(L2)
# H0 : a0 = a1 = 0, p-value = 0.0447 -> 압력 수준 간 차이가 유의하다. 
# H0 : b0 = b1 = 0, p-value = 0.3125 -> 귀무가설을 기각할 수 없다. 온도에 따른 수준 간 차이가 유의하지 않다. 
# H0 : ab00 = ... = ab11 = 0, p-value = 1.0000  -> 귀무가설을 기각할 수 없다. 온도와 압력에 따른 상호작용 효과가 있다고 할 수 없다. 

## 수준 0, 1로 표현해야 함 !!

# 요인 효과에 대한 모수추정 
model.tables(L2) # hat a1, a2, b1, b2, 상호작용 효과를 알 수 있음 
# 각 효과를 더하면 모두 0이다. 
# 상호작용 교과의 경우 가로 세로 더해도 모두 0이 된다. 


## 교락법

y3 = c(55, 64, 74, 105, 66, 63, 103, 73, 65, 100, 63, 86, 60, 60, 87, 106)
rep3 <- as.factor(rep(1:2, each=8)) # 반복 (반복1 8개, 반복2 8개)
block3 <- as.factor(rep(rep(1:2, each=4), 2)) # 블록 1, 블록 2 
a3 <- as.factor(c(0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0))
b3 <- as.factor(c(0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1))
c3 <- as.factor(c(0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1))
data.frame(y3, rep3, block3, a3, b3, c3)

# 분산분석 
L3 <- aov(y3~rep3+rep3:block3+a3*b3*c3)
summary(L3)
# C요인 p-value=0.0376로 유의수준 0.05에서 C 효과만 유의함. 

# 평균
model.tables(L3, type="means")
# rep -> ABC 교락 8개 데이터들의 평균
# A -> 0수준, 1수준일 때의 평균 
# rep:block -> 각 조합별로 평균 

model.tables(L3, type="effects")


## 교락법 2
y4 = c(10, 17, 9, 10, 17, 12, 19, 11,
      11, 9, 16, 16, 8, 9, 6, 2,
      6, 15, 8, 1, 9, 14, 7, 14,
      17, 13, 9, 16, 9, 15, 17, 14)
rep4 <- as.factor(rep(1:4, each=8))
block4 <- as.factor(rep(1:8, each=4))
a4 <- as.factor(c(0, 1, 0, 1, 
                  1, 0, 1, 0, 
                  0, 0, 1, 1, 
                  1, 1, 0, 0, 
                  0, 1, 0, 1, 
                  0, 1, 0, 1, 
                  1, 0, 0, 1, 
                  0, 1, 1, 0))                
b4 <- as.factor(c(rep(c(0, 1, 0, 1), 4), c(0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1))) # 끝까지 패턴 맞는지 확인하기, 아니라면 하나하나 넣어야 함 
c4 <- as.factor(rep(c(0, 0, 1, 1), 8))
data.frame(y4, rep4, block4, a4, b4, c4)

# 상자그림 
plot(y4~rep4)
plot(y4~block4)
plot(y4~a4)
plot(y4~b4)
plot(y4~c4)

# 분산분석 
L4 <- aov(y4~rep4+block4+a4+b4+c4)
summary(L4)
# 블록 A의 효과, 블록 반복 효과가 유의하다는 것을 알 수 있음 

# 모든 요인 수준평균
model.tables(L4, type="means")

# 모든 요인 수준효과
model.tables(L4, type="effects")
# 요인 A의 수준효과는 a0 = -2.375, a1 = 2.375 
# 요인 B의 수준효과는 b0 = 0.4375, b1= -0.4375 
# 요인 C의 수준효과는 c0 = 0.5, c1 = -0.5

# 상호작용 효과까지 확인한 실험 
L4_interaction <- aov(y4~rep4+block4+a4+b4+c4+a4:b4+a4:c4)
summary(L4_interaction)

model.tables(L4_interaction)
model.tables(L4_interaction, type="means")
