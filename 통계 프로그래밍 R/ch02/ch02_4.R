k_score <- c(1:10)
k_score_2 <- c(11:20)

# score라는 벡터로 저장
score <- c(k_score, k_score_2)
score

### 데이터의 형태
# 숫자형 numeric
# 문자형 character
# 논리값 logical 

# 숫자형 데이터 벡터 
y  <- c(1, 5, 7)

# 문자형 데이터 벡터 
family  <- c("kim", "lee", "chulsu", "sunhee")
# 데이터 이름을 정해줌 
names(family) <- c("mather", "father", "son", "daughter")
family

# 문자와 숫자를 섞어서 저장하면 숫자도 문자형 데이터로 인식함
x <- c("kim", 1, 2)

# 논리형 데이터 벡터
c(T, F, F, F, T, T, F)
x <- -3:3

# 2보다 작으면 F, 2보다 크면 T
w <- x < 2

# 논리형 데이터의 합 -> true인 경우는 1, false인 경우는 0으로 주어저 계산됨
sum(w) # x에서 2보다 작은 데이터의 개수가 됨 = 백터에서 TRUE인 경우의 수 

### 데이터의 형태 변환

# 숫자형 데이터 백터 
fact <- c(1, 2, 0)

# 범주형 factor로 변환
fact1 <- as.factor(fact)

# 논리형 데이터 객체로 변, 0이면 FASLE, 이외는 TRUE 
f.log <- as.logical(fact)

# 범주형 데이터 생성 
exp.fact <- factor(c("exp1", "exp2"))
# 숫자형 데이터 객체로 변환
fact2 <- as.numeric(exp.fact) # 알파벳 순서에 따라 숫자로 변환함 
