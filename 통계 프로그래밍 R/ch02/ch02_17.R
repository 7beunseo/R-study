### 객체 관리
x <- 1
mode(x)

length(x)

a <- c(1, 2, 3)
a

b <- factor(1:3)
b

matrix(1:4, nrow=2)

x <- 1:4; n <- 10; y <- 2:4
data.frame(x, n)

# list 생성 (이름 지정하지 않음)
L1 <- list(x, y)
L1

# A, B라는 이름을 지정함 
L2 <- list(A=x, B=y)
L2

# time series
ts(1:10, start=2001)

# 수학식 
x <- 3; y <- 2.5; z <- 1
exp1 <- expression(x / (y + exp(z))) # 수학식 자체를 문자열이 아닌 R 코드 객체로 저장함 
exp1 # 아직 계산이 되지 않음 

eval(exp1) # 실제 계산 실행 

# 리스트
authors <- data.frame(
  surname = I(c("Turkey", "venables", "Tiserney", "Ripley", "McNeil")),
  nationality = c("US", "Australia", "US", "UK", "Australia")
)
b <- list(authors, c(11, 12, 13), c("A", "B"))
b[[1]] # 리스트 접근하려면 [[1]] 이렇게 써야 함. [1, ]처럼 쓰려면 데이터프레임을 사용해야 함 
b[[1]][1,]
b[[2]] # 리스트 2번재 요소 접근 

# 리스트 요소에 이름 부여, $로 접근할 수 있음 
names(b) <- c("data.frame", "num.vector", "char.vector")
b$num.vector[1]
b$num.vector
b[[2]] # 여전히 리스트 인덱싱은 가능함 

### 데이터 객체 지우기 
