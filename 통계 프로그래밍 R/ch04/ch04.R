# 확률 밀도 값 (f(x))
# 누적확률 (P(X<=x))
# 사분위수값 q 

# z~(0, 1)일 때 P(Z<=-1)을 구하고 그래프를 그려보기
pnorm(-1, mean=0, sd=1)

# z~N(0,1)일 때 P(Z<=-1)을 구하고 그래프를 그려보기
1 - pnorm(-1)

# 평균 100, 표준편차 16인 정규분포로부터 난수 한 개를 발생시키기
rnorm(1, 100, 16)

# 평균 280 표준편차 10인 정규분포 집단
# 정규분포 집단 가정
rnorm(5, 280, 10)

# P(X<=270)
pnorm(270, 280, 10)

# 아래 꼬리로부터 10%에 해당하는 값
qnorm(0.1, 280, 10)

# 오른쪽 꼬리로부터 10%에 해당하는 값
qnorm(0.1, 280, 10, lower.tail=F)
qnorm(0.9, 280, 10)

# 평균 0, 표준편차 1인 표준정규분포
# 왼쪽 꼬리로부터의 확률이 0.05
qnorm(0.05)

# 왼쪽 꼬리로부터의 확률이 0.95(오른쪽 꼬리로부터의 확률이 0.95)가 되는 값
qnorm(0.95)
qnorm(0.05, lower.tail=F)

# x = 0에서의 확률밀도값
dnorm(0)

# 표준정규분포로부터 발생된 난수 100개에 대해 히스토그램과 확률밀도함수 추정선을 그림
hist(rnorm(100))

### t 분포
# 확률 밀도 함수 dt(x, df=a)
# 누적확률 pt(q, df=a)
# 사분위수 qt(p, df=a)
# 난수 rt(p, df=a)

### 균일 분포
# 확률 밀도 함수 dunif(x, min=a, max=b)
# 누적확률 punif(x, min=a, max=b)
# 사분위수 qunif(x, min=a, max=b)
# 난수 runif(x, min=a, max=b)

### 지수 분포
# 확률 밀도 함수 dexp(x, rate=r, log=FALSE)
# 누적확률 pexp(x, rate=r, lower.tail=T, log.p=FALSE)
# 사분위수 qexp(x, rate=r, lower.tail=T, log.p=FALSE)
# 난수 rexp(x, rate=r, lower.tail=T, log.p=F)

### f 분포
# 확률 밀도 함수 df(x, df1=d1, df2=d2)
# 누적 확률 pf(q, df1=d1, df2=d2)
# 사분위수 qf(p, df1=d1, df2=d2)
# 난수 rf(n, df1=d1, df2=d2)

### 카이제곱 분포
# 확률밀도 함수 dchisq(x, df=k)
# 누적 확률pchisq(q, df=k)
# 사분위수 qchisq(p, df=k)
# 난수 rchisq(n, df=k)

# 자유도가 5인 t인 분포
hist(rt(1000, df=5))
# 표준정규분포
hist(rnorm(1000))
# 평균이 1인 지수분포
hist(rexp(1000, rate=1))
# 평균이 3인 포아송분포
hist(rpois(1000, lambda=3)
     
### 이산분포
# 확률밀도함수 dbinom(x, size=n, p=pr)
# 누적확률 pbinom(q, size=n, p=pr)
# 사분위수 qbinom(p, size=n, p=pr)
# 난수rbinom(n, size=n, p=pr)

# p = 0.3
# n = 10
bin <- dbinom(0:5, size=10, prob=0.3)
names(bin) <- 0:5
bin

# x=c(1, 6, 8)일 경우 각 값까지의 "누적 확률"
x <- c(1, 6, 8)
pbinom(x, size=10, prob=0.3)

# 0.2, 0.5, 0.8의 누적확률을 갖는 확률변수값
p <- c(0.2, 0.5, 0.8)
qbinom(p, size=10, prob=0.3)

# 이항분포 B(10, 0.3)을 따르는 난수 5개
rbinom(5, size=10, prob=0.3)

### 포아송분포
# dpois(x, lambda=a)
# ppois(q, lambda=a)
# qpois(p, lambda=a)
# rpois(n, lambda=a)

# 평균 3인 포아송분포
# 확률 변수 값이 1, 2, 3, 4인 경우 각 값까지의 누적 화률을 구함 
ppois(1:4, lambda=3)
# 누적확률이 0.2인 확률변수값을 구함
qpois(0.2, lambda=3)
# 평균 3인 포아송분포를 따르는 난수10개를 발생
rpois(10, lambda=3)

# P(X <= 3)
ppois(3, lambda=3)

# P(X >= 4)
1 - ppois(3, lambda=3)
ppois(3, lambda=3, lower.tail=F)
# P(3 <= X <= 5)
ppois(5, lambda=3) - ppois(2, lambda=3)
# P(X > 5)
1-ppois(5, lambda=3)
ppois(5, lambda=3, lower.tail=F)

plot(table(rpois(100, lambda=3)), type="h", col="red", lwd=10)


### 정규성 검정 
# Q-Q 그림
x <- rnorm(10)
hist(x)
qqnorm(x)
# 기울기가 45도인 직선을 그어 찍힌 점들이직선에서 많이 벗어난다? -> 데이터가 정규성에서 벗어난다.  
qqline(x)
# 데이터들이 직선에서 벗어나면 정규성에서 벗어남 

# 데이터에 대한 검정통계량
# 귀무가설 : 데이터들은 정규분포를 따른다
shapiro.test(x)
# p-value = 0.8042 로 귀무가설 기각하지 못함 -> 정규분포를 따름

### 중심극한정리와 모의실험
m <- 50
mx <- rep(0, m)
n.value <- c(5, 10, 15, 30, 50)

plot(0, 0, type="n", xlim=c(0, 1), ylim=c(0, 10), ylab="density",
     xlab="mx", main="uniform mean to normal")
for(k in 1:length(n.value)) { # 표본의 개수 
  n <- n.value[k]
  for(i in 1:m) {
    mx[i] = mean(runif(n, 0, 1))
  }
  lines(density(mx), lty=k, col=k)
}
