### 조건문
x <- c(1, -2, -3, 4, 5)
pos <- rep(0, length(x))
for(i in 1:5) {
  if(x[i] > 0) pos[i] <- 1
}
pos

### 결측값

# 결측값
y <- c(1, 6, 2, NA)

# 결측값의 여부를 논리연산자로 알아보기
is.na(y)

# x > 2인 경우만을 선택하여 벡터를 만들기
y[y>2]

# 결측값이 포함되어있는 경우 mean() -> NA로 출력됨
mean(y)

# na.rm=TRUE 옵션을 이용하여 결측값을 제외한 데이터로 함수값을 구하기
mean(y, na.rm=TRUE)

# 결측값을 제외한 데이터 벡터 생성 (변수에 꼭 할당해야 함)
xx <- na.omit(y)

# 순위 부여 (default NA가 가장 순위 낮음)
rank(y)
y <- c(1, 6, 2, NA, NA)
rank(y)

# 결측값에 제일 작은 순위를 줌 
rank(y, na.last=FALSE)
