# 1

A <- rep(c("A1", "A2"), each=6)
B <- rep(rep(c("B1", "B2", "B3"), each=2), 2)
y = c(48, 58, 28, 33, 7, 15, 62, 54, 14, 10, 9, 10)

A <- as.factor(A)
B <- as.factor(B)

tapply(y, A, mean) # A1, A2 수준 평균 
tapply(y, B, mean) # B1, B2 수준 평균 
tapply(y, A:B, mean) # 수준 조합 평균 

# 분산분석 
L <- aov(y~A+B+A:B)
L
summary(L)
anova(L)
# B 효과와 상호작용 효과가 유의함 
# A 효과는 유의하지 않음 
# 요인 A 수준 간 평균이 동일하다
# 요인 A 효과와 요인 A와 B의수준 조합에 따른 영향이 있다
# 자동차 진공관은 펌프가열 전압과 배기량 지수의 상호작용에 유의한 영향을 받는다 

# 요인효과 추정, 모수 추정값
# 요인 효과
# 처리 수준 간 효과임!! (A의 주효과, B의 주효과, AB의 주효과가 아님 -> 모수에 대한 추정 값 ex hat(a1, ab12 등))
# 주효과, 상호작용효과를 구하기 위해서는 대비를 이용하거나, 주효과의 경우 수준 평균 차를 이용하면 된다. 
model.tables(L, type="effect")

# 요인 평균
# 처리 수준 간 평균임!! 
model.tables(L, type="mean")
# A:B의 경우 각 수준마다 존재하는 데이터의 평균이 됨 

# 상호작용 효과에 대한 그림
interaction.plot(A, B, response=y) # A가 x축
interaction.plot(B, A, response=y) # B가 x축축


# 2
y = c(90.4, 90.7, 90.2, 90.2, 90.1, 90.4, 92.2, 91.6, 90.5, 93.7, 91.8, 92.8)
A <- rep(c("A1", "A2"), each=6)
B <- rep(c("B1", "B2", "B3"), 4)
data.frame(y, A, B)
A <- as.factor(A)
B <- as.factor(B)

plot(y~A) # 온도에 대한 차이 있어보임 
plot(y~B) # 압력 차이 없어보임 

# 분산 분석을 위한 가설검정
aov.res <- aov(y~A+B+A:B)
anova(aov.res)
# 온도와 압력의 상호작용 효과가 있다고 할 수 없음 

# p-value 구하기
1 - pf(14.010, 1, 6)
# 1 - pf(F-value, df1, df2)

plot(aov.res)

interaction.plot(A, B, y)
interaction.plot(B, A, y)


# 3
y = c(7, 9, 2, 3, 2, 1, 10, 12, 5, 7, 3, 2,
      14, 16, 3, 7, 3, 4, 12, 10, 3, 6, 4, 5)
A <- as.factor(rep(c("A1", "A2"), each=12))
B <- as.factor(rep(rep(c("B1", "B2"), each = 6), 2))
C <- as.factor(rep(rep(c("C1", "C2", "C3"), each=2), 4))
data.frame(y, A, B, C)

tapply(y, A, mean)
tapply(y, B, mean)
tapply(y, C, mean)
# 압력 , 습도, 처리조합 평균 
tapply(y, A:B:C, mean)

L <- aov(y~A*B*C)
anova(L)

model.tables(L, type="effect")
model.tables(L, type="mean")

# 온도와 압력 상호작용 효과를 제외하고 다른 상호작용 효과는 없음 
# 유의하지 않은 고차 상호작용 효과들을 오차항에 포함시킨 축소모형
# 이때 통계적 모형은 추가한 상호작용항만 넣어야 함 (주효과는 그대로)
M <- aov(y ~ A+B+C+A:B) # C 포함해야 함 -> 주효과는 모두 넣고, 유의하지 않은 상호작용 효과만 빼기 
anova(M)

interaction.plot(A, B, y)
interaction.plot(A, C, y)
interaction.plot(B, C, y)

# 반복 효과 고려
# 모든 조건 조합에서 두 번의 실험을 했다는 뜻임
# 반복을 할 때 다른 조건에서 반복했을 수 있음 -> 이를 고려하는 것 
# 예를 들어 반복을 진행하는 기계가 다른 경우
# 첫 번째 데이터는 기계 1에서 진행, 두 번째 데이터는 기계 2에서 진행 -> 블록에 따른 효과 차이도 고려해야 함 
repp = as.factor(rep(1:2, 12))

M1 <- aov(y~repp+A*B*C)
anova(M1)
