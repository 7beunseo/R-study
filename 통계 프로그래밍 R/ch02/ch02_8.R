### 벡터와 행렬 표현의 연산

# 데이터 열백터
x <- c(1, 3, 5)
x

# 데이터 행렬
matrix(1:6, ncol=2) # 3 x 2 행렬 
matrix(1:6, nrow=2) # 2 x 3 행렬 

### 기본 연산
x <- c(1, 2, 3, 4, 5) # 5 x 1 행렬 
y <- c(-1, -2, -3, -4 , -5) # 5 x 1 행렬 

# 더하기
x + y

# transpose + 행렬 곱
t(x) %*% y

x %*% t(x)

# 각 성분의 곱
x * y

# x, y를 하나의 열백터로 만들기
temp <- c(x, y)

# 두개의 열백터를 가진 행렬로 만들기
temp1 <- cbind(x, y) # 5 x 2 

# 두개의 행백터로 가진 행렬로 만들기
temp2 <- rbind(x, y) # 2 ㅌ 5 

# 행렬의 각 성분값을 제곱하기
temp1 * temp1
# 전치행렬 (transposed matrix) 구하기
t(temp1)

# 행렬의 곱
t(temp1) %*% temp1

# 행렬의 차원 구하기
dim(temp1)

### 역행렬
a1 <- c(34.74, 15.66)
a2 <- c(15.55, 378.6)
s <- rbind(a1, a2)

# 역행렬 구하기 
library(MASS)
solve(s)
ginv(s)