### 반올림
a <- c(-2.456, 3.6789, 5.23445676)

# 올림 
ceil(a)
ceiling(a)

# 내림 
floor(a)

# 소숫점 제거
trunc(a)

# 반올림
round(a)

# 특정 소숫점까지 반올림
round(a, digits=2)

### 기초 통계량
k_score <- c(40:50)

# 총합
sum(k_score)

# 평균
mean(k_score)

# 최댓값
max(k_score)

# 최솟값
min(k_score)

# 범위
range(k_score)

# 분산
var(k_score)

# 표준편차
sd(k_score)

# 중앙값
min(k_score)

# 순위
rank(k_score)

# 벡터의 길이
length(k_score)

### 행 열별 함수 적용
x <- cbind(x1=3, x2=c(4:1, 2:8)) # 꼭 = 연산자를 써야 함 (그래야 x1으로 설정됨 )
# x <- cbind(x1<-3, x2<-c(4:1, 2:8))

dimnames(x)[[1]] <- letters[1:11] # 행을 a~k로 변경함 

# 열별로 평균 구하기 (apply에 2 넣어주기 - 2:열)
apply(x, 2, mean)
# 행별로 합 구하기 (apply에 1 넣어주기 - 1:행)
apply(x, 1, sum)

### 요인별 함수 적용
# 데이터 가져오기
library(MASS)
attach(cabbages)
data("cabbages")
head(cabbages)

# Cult, Date 별 HeadWT의 평균을 구하고자 함 
cabbages.mean <- aggregate(HeadWt, list(Cult, Date), FUN="mean")
cabbages.mean

# 컬럼 이름 변경 (원래는 Group1, Group2 이렇게 되어있었음)
names(cabbages.mean) <- c("Cult", "Date", "Mean of HeadWt")
cabbages.mean

### 필요한 데이터만 선택하기

# Date=18의 경우의 표본만 선택해서 데이터를 만들기 
cabbages1 <- cabbages[(cabbages$Date=="d16"),] # 행만 선택하고 열은 모두 출력하기 위해 ,를 써야함 
cabbages1

# Vitamin C 함량이 50 이상인 경우만 선택하고자 할 때
cabbages2 <- cabbages[(cabbages$VitC >= 50),]
cabbages2

# Date-d16에 속하며 Vitamin C 함량이 60 이상인 경우
cabbages3 <-  cabbages[(cabbages$Date=="d16" & cabbages$VitC >= 60),]
cabbages3

### 순서 함수
id <- c(1, 2, 3, 4, 5)
a <- c(4, 9, 7, 2, 8)
da <- cbind(id, a)

# 벡터 a의 성분 값을 순서대로 배열
a_s <- sort(a)
a_s # a가 순서대로 정렬됨

# a 값 순서대로 개체별 데이터르 재배열
da[order(a),] # a에 따라 행을 재배열한 것이기 때문에 ,의 앞에 씀 

# 벡터 a 성분 값에 순위값을 주고자 할 때
x <- c(11, 24, 24, 30, 30, 30)
rank(x) # 동점이면 소숫점으로 동일하게 표시 (평균 순위)

# x 값에 순서를 주고자 할 때 (동점은 상관없이 단순히 인덱스 순으로 나열)
order(x)
