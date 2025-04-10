# 행렬 생성하기 
dat <- cbind(c(54, 3), c(7, 12))

# 행렬에 이름을 줌 
rownames(dat) <- c("p.puckled", "p.unbuckled")
colnames(dat) <- c("c.buckled", "c.unbuckled")
dat

# 주변 분포를 구하기
margin.table(dat, 1) # 각 열에 대하여 
margin.table(dat, 2) # 각 행에 대하여 

# 행합과 열합 구하기
rowSums(dat) # margin.table(,1)와 동일
colSums(dat) # margin.table(,2)와 동일

# 이원분할표에 주변빈도를 포함고자 할 경우
addmargins(dat) # sum이라는 행이 추가되면서 주변확률도 표시함 

# 전체 도수에 각 칸의 도수 비율을 구하고자 할 때
prop.table(dat)
prop.table(addmargins(dat))

# 막대그래프로 행과 열의 빈도 비교 진행
barplot(dat)
barplot(dat, legend=T) # 설명 추가 
barplot(dat, legend=T, beside = T) # 겹쳐서 쌓아 올리지 않음 

# 니코틴 환자 분석
nico <- read.csv("table6.2_nicotin.csv", header=T)
attach(nico)
y <- table(nicotin, stopsmoke)
prop.table(y)


#########
상관 계수
#########

blood <- read.csv("blood.csv", header=T)
attach(blood)
head(blood)

# 남자 어른의 혈압 평균
rowMeans(blood[,2:3])
apply(blood[,2:3], 1, mean)

# 기계측정평균, 간호사측정평균
colMeans(blood[,2:3])
apply(blood[,2:3], 2, mean)

# 기계, 간호사 측정값간의 상관계수
cor(machine, expert)

# 산점도와 각각의 상자 그림과 확률밀도함수 그림 그리기
boxplot(machine, expert, names=c("machine", "expert"))

plot(density(machine))
lines(density(expert), lty=2)
legend(120, 0.025, legend=c("machine", "expert"),lty=c(1, 2))

# 데이터의 순위를 구하고 순위들의 상관계수
# method="spearman"
cor(machine, expert, method="spearman")


# 귀무가설 => 상관계수가 0이다 
cor.test(machine, expert)
# 귀무가설 기각 -> 상관 계수는 0이 아니다.

# 신체 데이터
body <- read.csv("table6.4_body.csv", header=T)
attach(body)
cor(height, weight)

plot(height, weight)

# trees 데이터
data(trees)
attach(trees)
