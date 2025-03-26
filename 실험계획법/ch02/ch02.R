# 전선 데이터에 대한 기초통계량
x <- c(5.8, 8.0, 9.3, 7.2, 7.8, 10.3, 11.2, 10.8, 9.7, 8.5)
mean(x)
sd(x)
var(x)
summary(x)
plot(x)
boxplot(x, ylab="length")


# 추정
# 전선에 대한 힘 데이터는 정규분포를 따른다고 한다. 평균에 대한 95% 신뢰구간 구하기 
n <- length(x)
m <- mean(x)
sd <- sd(x)
qnorm <- qnorm(0.975)
bound <- s / sqrt(n) * qnorm
lo <- m - bound
up <- m + bound

# P(Z <= -1)
pnorm(-1)

# P(Z >= -1)
pnorm(-1, lower.tail=FALSE)
1-pnorm(-1, lower.tail=TRUE)

# 아래로부터 10%에 해당하는 값을 구함
qnorm(0.1)

# 위로부터 2.5%에 해당하는 값을 구하고자 함
qnorm(0.025, lower.tail=FALSE)
qnorm(0.975)

# x=0에서의 확률밀도함수
dnorm(0)


# 분산에 대한 카이제곱검정
var(x)
alpha <- 0.05

lo <- (n-1) * var(x) / qchisq(alpha/2, df=n-1, lower.tail=F) # 양측 신뢰구간 계산 
up <- (n-1) * var(x) / qchisq(1-alpha/2, df=n-1, lower.tail=F)

sigma <- -3.5
chi.t <- var(x) * (length(n) -1)/sigma # 검정통계량 x^2

chi.t

pchisq(chi.t, length(x) - 1, lower.tail=var(x) < sigma) * 2 # p-value를 구함, 양측검정이므로 *2 
pchisq(chi.t, length(x) - 1, lower.tail=var(x) < sigma)


# 두 종류의 지혈제 A와 B의 효과를 측정한 데이터이다. 실험 참여자에게 같은 상처를 낸 후 지혈될 때까지의 시간을 측정했으며, 모집단은 정규분포를 따른다고 한다. 
# 지혈제 A와 B의 분산 차이가 있는지 검정하고자 한다. 
x1 <- c(1.1, 2.3, 4.3, 2.2, 5.3, 6.5, 7.0)
x2 <- c(3.3, 4.3, 3.5, 3.6)
var.test(x1, x2)
# p-value가 0.02

# 다음은 암컷 원숭이의 몸무게를 조사한 자룡다. 몸무게는 분산이 1인 정규분포를 따른다고 한다. 암컷 원숭이의 평균 몸무게가 8.5라고 할 수 있는지 검정하고자 한다.
# H0 : mu = 8.5
x <- c(8.3, 9.5, 9.6, 8.75, 8.4, 9.1, 8.15, 8.8)
mu0 <- 8.5
z <- (mean(x) - mu0) / (sd(x) / sqrt(length(x))) # 검정 통계량을 구함 
pvalue <- pnorm(z, lower.tail=mean(x) < mu0) * 2 # p-value 구하기 
pvalue

# t.test(x, mu=mu0, alt="two.sided") -> 모분산이 알려져있으므로 t-검정이 아닌 z-검정을 사용함 

# 전선을 끊기 위한 힘을 알아보기 위해 측정한 데이터는 다음과 같다. 이때 R 프로그램을 이용하여 기초통계량을 구하고자 한다.
x <- c(5.8, 8.0, 9.3, 7.2, 7.8, 10.3, 11.2, 10.8, 9.7, 8.5)
t.test(x, mu=7, alt="two.sided")
t.test(x, mu=7, alt="greater")
t.test(x, mu=7, alt="less")
