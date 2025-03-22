# 1.
# a
1 + 2 * (3 + 4)
# b
1 + (1/2) + (1/3) + (1/4) + (1/5) + (1/6)
# c
sqrt((4 + 3) * (2 + 5))
# d
((1 + 3) / (4 + 5))^3
# e
122 + 12 * 23
# f
factorial(10)
# g
sum <- 0
for(i in 5:11) {
  sum <- i^2  
}
sum
# h
sin((80/180) * pi) + cos((40/180) * pi)
# i
log(24, base=10)
log(10)
# j
x <- 15
y <- 3
sqrt((3 * x ^ 2 + 2 * y ^ 3) / (x + y) * (x - y))
# k 
cos(pi / 3)

# 2
# a
x <- c(2, 3, 5, 7, 9, 10)
# b
x2 <- x^2
# c
sum(x2)
# d
x - 2
# e
min(x)
max(x)
# f
x_up <- x[x>5]
x_up
# g
length(x)
# h
t(x) %*% x
# i
x %*% t(x)
# j
xc <- cbind(x, x2)
# k
xr <- rbind(x, x2)

# 3
a <- cbind(c(1, -1, 4), c(-1, 1, 3), c(4, 3, 2))
a

b <- cbind(c(3, -2, 4), c(-2, 1, 0), c(4, 0, 5))
b

x <- c(1, -2, 4)
y <- c(3, 2, 1)

# a
a + b
# b
t(a)
# c
t(x) %*% a %*% y
# d
t(x) %*% x
# e
t(x) %*% a %*% x
# f
t(x) %*% y
# g
t(a) %*% a
# h
a %*% b
# i
t(y) %*% b
# j
x %*% t(x)
# k
x + y
# l
x - y
# m
t(x - y)
# n
x %*% t(y)
# p
t(a) + t(b)
# q
t(a + b)
# r
3 * x
# s
(t(x) %*% y) ^2
b %*% a
# u
library(MASS)
solve(a)

# 4
# a
rep("a", 8)
# b
rep(1:5, each=3)
# c
seq(1, 100, 2)

# 5
library(UsingR)
data(primes)
# a
length(primes[primes <= 2003])
# b
length(primes[primes<200])
# c
mean(primes)
# d
primes[primes>=1000]
# e
pp <- primes[primes >= 500 & primes <= 1000]

# 6
elder <- c(86, 71, 77, 68, 91, 72)
younger <- c(88, 77, 76, 64, 96, 72)
data <- data.frame(elder, younger)
data_c <- cbind(elder, younger)
data_c

# a
# 주의! cat은 데이터프레임을 출력할 수 없음
# dataframe은 안 됨 
cat(data_c, file="brother_c.txt") # 한 줄로만 됨 ;; 
write.table(data, file="brother.txt", row.names=FALSE)
# b 
#패키지 설치하기
install.packages("openxlsx")
library("openxlsx")
write.xlsx(data, file="brother_e.xls")
# c
write.csv(data, "brother_e.csv", row.names=FALSE)
# d
brother.txt <- read.table("brother.txt", header=T)
brother.txt
elder <- brother.txt$elder
younger <- brother.txt$younger
elder_mean <- mean(elder)
elder_sd <- sd(elder)
younger_mean <- mean(younger)
younger_sd <- sd(younger)
result <- data.frame(elder=c(elder_mean, elder_sd), younger=c(younger_mean, younger_sd))
result
# e
write.table(result, file="attackout.txt", row.names=F)
# f 
write.xlsx(result, file="atttackout.xls")

# 7
# a
x <- c(-4.123, -3.556, 2.213, 3.785)
# b
y <- round(x, 2)
# c
x - y
# d
round(x, 1)
# e
ceil(x)

# 8
# a
x=data.frame( 
  surname=I(c("kim","lee","park","oh","yang","min","jung")),
  Korean=c(93,76,87,92,98,75,82))
x

y=data.frame(
  surname=I(c("kim","lee","park","oh","yang","min","jung","choi")),
  English=c(90,94,88,75,79,87,88,90))
y
d <- merge(x, y, by.x="surname", by.y="surname")
d
dd <- merge(x, y, by.x="surname", by.y="surname", all=TRUE)
dd
# b
# 전체 행 범위에 포함
# 1->사람 이름이므로 포함하면 안 됨
# 2, 3 행만 포함해야 함

# 각 학생에 대해서 평균을 구함 
apply(dd[, 2:3], 1, mean)  
# 과목별 평균을 구함 
apply(dd[, 2:3], 2, mean)  
# 결측치 포함 
apply(dd[, 2:3], 2, mean, na.rm=T)  

# 9
class1 <- data.frame(
  name=I(c("kim", "lee", "park", "oh", "yang", "min", "jung", "moon")),
  korean=c(93, 83, 87, 95, 98, 77, 82, 92)
)
class2 <- data.frame(
  name=I(c("kang", "yun", "park", "cho", "yang", "min", "jung", "choi")),
  korean=c(90, 95, 88, 75, 79, 87, 90, 90)
)
# a
# apply는 차원이 있는 객체만 가능, 아래 코드는 에러가 생김 
# apply(class1[,2], 2, mean)
mean(class1[,2])
mean(class1$korean)

mean(class2[,2])
mean(class2$korean)

sd(class1$korean)
sd(class2$korean)

# b
korean <- rbind(class1, class2)
mean(korean$korean)
sd(korean$korean)

# c
korean[order(korean$name),]

# d
korean[order(-korean$korean), ]
