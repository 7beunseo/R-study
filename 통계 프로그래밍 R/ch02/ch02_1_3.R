# 1부터 5까지 벡터 만들기 
x <- 1:5
# x <- c(1:5)

# x 벡터의 성분 중 3보다 크거나 작은 값에 20을 대입
x[x >= 3] = 20

# 루트 2
sqrt(2)

# sin(파이)
sin(pi)

# e^1
exp(1)

# log 10 10
log(10, 10)
log(10, base=10) # base를 지정해줄 수 있음 

# log 2 10
log(10, base=2)

# log e 10
log(10, base=exp(1))
log(10) # 기본 베이스가 e (base를 생략하면 e가 base가 됨)

# |-3|
abs(-3)

# 5!
factorial(5)

# 5C2
choose(5,2)

# 메모리에서 생성된 객체를 지움
x <- 1; y <- 2
rm(x); rm(y)

# 메모리에서 생성된 모든 객체들을 지움 
rm(list=ls())
# ls()를 하면 현재 할당된 객체 목록이 나옴
# list=ls() 형태로 전달하여 객체 목록이야 라고 전달해줌 

# 메모리를 최대한 활용하고자 할 때
memory.size(max=TRUE) # 'memory.size()' is no longer supported 
