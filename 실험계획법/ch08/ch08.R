#####
# 1 #
#####

y1 = c(22, 32, 34, 40)
a1 <- as.factor(c(0, 1, 0, 1)) # + -> 1, - -> 0
b1 <- as.factor(c(0, 0, 1, 1))
c1 <- as.factor(c(1, 0, 0, 1))
data.frame(y1, a1, b1, c1)

plot(y1~a1) # 평균 차이가 있어보임 
plot(y1~b1) # 평균 차이가 있어보임
plot(y1~c1) # 평균 차이가 없어보임 (편차는 있음)

faov1 <- aov(y1~a1*b1*c1)
summary(faov1) 
anova(faov1) # 검정 결과까지 나옴 -> 그러나 NAN 
# 2차, 3차 상호작용까지 포함했지만 주효과밖에 나오지 않음
# 1차와 2차 효과를 구분할 수 없음 (별명 구조)
# 따라서 검정 결과도 나오지 않음 

faov1 <- aov(y1~a1+b1+c1)
anova(faov1)
# 주효과들만 확인하려고 해도 주효과와 이차 상호작용이 별명구조에 있어 검정 결과가 나오지 않음 
# 2^(k-1) 반복 없는 버전? 
# (2^(k) 반복 1과 다름 -> 이건 이차 상호작용까지 검정 결과가 나옴)

#####
# 2 #
#####

# 위의 데이터에 한 번 더 실험 진행
# 생성자 I=-ABC
# 2 ^ (3-1) 요인설계, 해상도 3 으로 추가 데이터를 얻은 상황
# 모든 처리조합에 대한 데이터가 구해짐 (3차상호작용 제외 모두 (반복 1인 2^3 설계임))
y2 = c(22, 32, 34, 40, 20, 36, 28, 30)
a2 <- as.factor(c(0, 1, 0, 1, 0, 1, 0, 1))
b2 <- as.factor(c(0, 0, 1, 1, 0, 0, 1, 1))
c2 <- as.factor(c(1, 0, 0, 1, 0, 1, 1, 0))
data.frame(y2, a2, b2, c2)

plot(y2~a2)
plot(y2~b2)
plot(y2~c2)

# 주효과 확인
# 모든 주효과가 유의하지 않음 
faov2 <- aov(y2~a2+b2+c2)
anova(faov2)

# 주효과와 2차 상호작용효과 확인
# 모든 효과가 유의하지 않음 
faov2 <- aov(y2~a2+b2+c2+a2:b2+a2:c2+b2:c2)
anova(faov2)

# 3차 상호작용효과까지 확인
# 유의성을 검정할 수 없음 
# 오차항의 Mse가 없으므로  
faov2 <- aov(y2~a2*b2*c2)
anova(faov2)
summary(faov2)

model.tables(faov2)


#####
# 3 #
#####

y3 = c(45, 80, 65, 60, 75, 45, 100, 96)
a3 <- as.factor(c(0, 0, 1, 1, 1, 0, 1, 1))
b3 <- as.factor(c(0, 1, 1, 0, 0, 1, 0 , 1))
c3 <- as.factor(c(0, 1, 0, 1, 0, 0, 0, 1))
d3 <- as.factor(c(0 ,0, 0, 0, 1, 1, 1, 1))
data.frame(y3, a3, b3, c3, d3)

plot(y3~a3)
plot(y3~b3)
plot(y3~c3)
plot(y3~d3)

tapply(y3, a3, mean)
tapply(y3, b3, mean)
tapply(y3, c3, mean)
tapply(y3, d3, mean)

# 주효과 분산분석
# 모두 유의하지 않음 
L3 <- aov(y3~a3+b3+c3+d3)
anova(L3)

# 모수 추정
model.tables(L3)


#####
# 4 #
#####
install.packages("FrF2")
library(FrF2)

design <- FrF2(16, 5, generators = 'ABCD', randomize = F)
design

nums <- runif(16)
add.response(design, nums)
aliases(aov(nums~A*B*C*D*E, data=design))



#####
# 5 #
#####

# 별명 구조 생각해보기 
design1 <- FrF2(4, 3, generators = 'AB', randomize = F)
design1

aliases(aov(y1~A*B*C, data=design1))


# 음수도 가능 
# 생성자 I=-ABC 
design1 <- FrF2(4, 3, generators = '-AB', randomize = F)
design1

aliases(aov(y1~A*B*C, data=design1))
