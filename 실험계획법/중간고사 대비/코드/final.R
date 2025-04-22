# 창이 이상해지면 ctrl + shf + 4 -> ctrl + shf + 1

# 패키지 미리 설치해두기 
install.packages("agricolae")
# 등분산성 확인을 위한 레빈 검정
install.packages("car")  # 처음 한 번만 설치
library(car)
leveneTest(data ~ age)


# 바틀렛 검정 
bartlett.test(y~group)

# 분산분석 
aov1 = aov(y~group)
summary(aov1)

# 회귀분석
summary.lm(aov1)

# lsd
pairwise.t.test(y, group, p.adjust="none", pool.sd=T) #LSD
# 직접
t <- qt(0.975, 15) # 오차 자유도 넣어주기 
mse = summ.aov1[[1]]$`Mean Sq`[2]
se <- sqrt(2 * mse / 4) # 반복수만큼 나눔 
lsd <- t * se
lsd
# bonferrnoi 
pairwise.t.test(y, group, p.adjust="bonferroni", pool.sd=F) #Bonferroni
# tukey
a.tukey = TukeyHSD(aov1, ordered=T)
a.tukey
plot(a.tukey)

# agricolae
install.packages("agricolae")
library(agricolae)
(LSD.test(aov1, "group", p.adj="none"))
(LSD.test(aov1, "group", p.adj="bonferroni"))
(HSD.test(aov1, "group", group=T))

##### 등분산성 확인을 위한 레빈 검정
install.packages("car")  # 처음 한 번만 설치
library(car)
leveneTest(data ~ age)

# 대비
# 쌍대비 생성
contr.treatment(5, base = 1, contrasts = T)
contrasts(group) <- contr.treatment(5, base = 1, contrasts = T)
summary.lm(aov(y~group)) # 쌍대비 결과 확인 

# 직교다항대비 
contrasts(group) = contr.poly(levels(group)) 
summary.lm(aov(y~group))

# 직접 직교대비
contrastmatrix = cbind( c(-2, -1, 0, 1, 2),
                        c(2, -1, -2, -1, -2),
                        c(-1, 2, 0, -2, 1),
                        c(1, -4, 6, -4, 1)
)

contrasts(group) = contrastmatrix
contrasts(group)

# 1개의 대비에 대한 검정
N = length(y)
k = 5
m = tapply(y, group, mean)
ni = tapply(y, group, length)
c1 = c(2,2,2,-3,-3)
summ.aov = summary(aov1)
mse = summ.aov[[1]]$`Mean Sq`[2]
f = sum(c1*m)^2 / (mse*sum(c1^2/ni))
1 - pf(f, 1, N-k)

# sst 합 
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

# 타우 추정값 출력
model.tables(aov1)

# 정규성 검정
shapiro.test(aov.out$residuals)