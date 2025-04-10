### d, p, q, r
* d : 확률밀도함수 값 f(x)
* p : 누적확률 값 P(X <= x)
* q : 사분위수 값 (적분)
* r : 난수 발생

### 정규 분포
* dnorm
* pnorm
* qnorm
* rnorm

### t 분포
`공통 인자 자유도 df` 
* dt
* pt
* qt
* rt

### 균일분포
`min, max 값 지정`
* dunif(x, min=a, max=b)
* punif(q, min=a, max=b)
* qunif(p, min=a, max=b)
* runif(n, min=a, min=b)

### 지수 분포
`rate 평균 지정(발생 비율, log=FALSE)`
* dexp(x, rate=r, log=F)
* pexp(q, rate=r, log.p=F)
* qexp(p, rate=r, log.q=F)
* rexp(n, rate=r)


### f 분포 
`자유도 df1, df2 지정`
* df(x, df1=a, df2=b)
* pf(q, df1=a, df2=b)
* qf(p, df1=a, df2=b)
* rf(p, df1=a, df2=b)

### 카이제곱분포
* dchisq(x, df=k)
* pchisq(q, df=k)
* qchisq(p, df=k)
* rchisq(n, df=k)

### 이항분포
`size (독립 시행 횟수), p (성공의 확률)`
* dbinorm(x, size=n, p=pr)
* pbinorm(q, size=n, p=pr)
* qbinorm(p, size=n, p=pr)
* rbinorm(p, size=n, p=pr)


### 포아송분포
`lambda=a 평균`
* dpois(x, lambda=a)
* ppois(q, lambda=a)
* qpois(p, lambda=a)
* rpois(n, lambda=a)

### 정규 확률 그림 
* QQPlot
```r
qqnorm(x)
qqline(x)
```
* Shapiro 검정
```r
shapiro.test(x)
```

### 모의실험
```r
m <- 50
mx <- rep(0, 50)
n.value <- c(5, 10, 15, 30, 50)

plot(0, 0, type="n", xlim=c(0,1), ylim=c(0, 10), ylab="density", xlab="mx", main="uniform mean to normal")

for(k in 1:length(n.value)) {
  n <- n.value[k]
  for(i in 1:m) {
    mx[i] <- mean(runif(n, 0, 1))
  }
  lines(density(mx), lty=k, col=k)
}
```
![image](https://github.com/user-attachments/assets/32af2102-be75-401f-8ee2-48b414fde9af)
