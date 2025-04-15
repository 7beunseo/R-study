#####
# 1 #
#####

data("InsectSprays")
attach(InsectSprays)
InsectSprays

# a
pie(table(InsectSprays$spray))

# b
mean(count)

# c
aggregate(count, list(spray), FUN="sum")
tapply(count, spray, sum)


#####
# 2 #
#####

d <- c(735, 320, 325, 392, 524, 450, 1459, 135, 465, 600, 330, 336, 280, 315, 870,
       906, 202, 329, 290, 1000, 600, 505, 1450, 840, 1243, 890, 350, 407, 286, 280)

# a
mean(d)
median(d)

# b
sd(d)
var(d)
summary(d)

# d
hist(d)

# e
boxplot(d)


#####
# 3 #
#####

d <- c(25, 16, 44, 62, 36, 58, 38)
# a
mean(d)

# b
var(d)

# c
sd(d)

# d
boxplot(d)

# e
boxplot(d, col="coral")

# f
stem(d)

#####
# 4 #
#####

# a
r <- rnorm(10)
install.packages("plotrix")
library(plotrix)
mean(r)
sd(r) / sqrt(10)
plotCI(1, mean(r), 2 * (sd(r) / sqrt(10)))

# 교수님 정답 
# a
m.u<-rep(NA, 10)
sd.u<-rep(NA, 10)
n<-20
for( j in 1:10){
  y<-runif(n, min=0, max=1 )
  m.u[j]<- mean(y)
  sd.u[j]<- sd(y)
}
print(m.u)
print(sd.u)

cat("From Unif dist:", "sample size=", n, 
    "\n", "mean=", m.u, 
    "\n", "sd=", sd.u)

# b
library(plotrix)
m=10 ;  meany=rep(0,m) ; std=rep(0,m)
n=20
for ( i in 1: m){
  y = runif(20, min=0, max=1 )
  meany[i] =mean(y)
  std[i]= sd(y)/sqrt(n)
}

plotCI(meany,1:m,2*std,pch=21,err="x", 
       main="CI with horizontal bars", scol="skyblue")
abline(v=0.5)  


#####
# 5 #
#####

d <- c(19, 21, 15, 23, 24, 15, 15, 15, 16, 29,
       18, 32, 20, 23, 24, 24, 25, 25, 25, 25,
       25, 25, 25, 36, 26, 28, 30)
# a
mean(d)
sd(d)

# b
sd(d)
var(d)
range(d)

# c
hist(d)
cutd <- cut(d, breaks=c(min(d), 20, 30, max(d)), include.lowest = T)
t <- table(cutd)
names(t) <- c("20 미만", "20 이상 30 미만", "30이상")
pie(t)
# 위 방식으로 하면 20이 첫 번째 그룹에 포함되어버림

# 직접 데이터를 나눠서 length를 계산해서 도수분포표를 만들면 됨 
d1 <- d[d<20]
d2 <- d[d>=20 & d<30]
d3 <- d[d>=30]
tab <- c(length(d1), length(d2), length(d3))
pie(tab)

dotchart(t)


#####
# 6 #
#####

d <- c(2.3, 2.4, 3.1, 2.2, 1.0, 2.3, 2.1, 1.1, 1.2, 0.9, 1.5, 1.1)

# a
mean(d)
median(d)

# b
var(d)
sd(d)
range(d)

# c
dd <- 2 * sd(d) / sqrt(length(d))
lo <- mean(d) - dd
up <- mean(d) + dd
lo; up

## 신뢰구간 t 분포 이용해야 함 ##
dat <- c(2.3, 2.4, 3.1, 2.2, 1.0, 2.3, 2.1, 1.1, 1.2, 0.9, 1.5, 1.1)
m <- mean(dat)
sd <- sd(dat)
n <- length(dat)
t <- qt(0.975, df=(n - 1))

up <- m - t * sd / sqrt(n)
lo <- m + t * sd / sqrt(n)
up; lo

# d
boxplot(d)

# e
stem(d)


#####
# 7 #
#####

d <- cbind(c(60, 30), c(10, 40))
d
# a
d[1,1]/sum(d[1,])

# b
d[2, 1] / sum(d[2,])

# c
d[1,1]/sum(d[1,]) - d[2, 1] / sum(d[2,])

# d
pie(d[1,])
pie(d[2,])
# 만약 흡연자와 비흡연자만으로 파이 그림을 그리고 싶다면?
pie(margin.table(d, 1))


#####
# 8 #
#####
x <- c(5.7, 6.7, 6.8, 7.9, 10.6, 11.3, 9.8, 8.4, 8.3, 9.5,
       6.7, 6.9, 9.8, 8.8, 12.1, 10.2, 9.5, 9.4, 9.3, 5.9)

  
# a
m <-  mean(x)

# b
t <- qt(0.025, lower.tail=F, df=length(x)- 1)
d <- t * sd(x) / sqrt(length(x))
lo <- m - d
up <- m + d
lo; up

# c
var(x)
sd(x)
range(x)

# d
boxplot(x)

# e
hist(x, probability = T)
lines(density(x))


#####
# 9 #
#####

x <- c(20870, 39400, 65000, 45000, 35890, 29000, 56770,
       23000, 38550, 59800, 39880, 56780, 35220, 48990)

n <- length(x)

# a
m <- mean(x)

# b
t <- qt(0.025, df=n-1, lower.tail=F)
d <- t * sd(x) / sqrt(n)
lo <- m - t
up <- m + t
lo; up

# c
sd(x)
var(x)
range(x)

######
# 11 #
######

x <- c(5.6, 7.8, 6.5, 7.2, 6.9, 7.3, 5.8, 7.5, 8.2, 7.8)

# a
m <- mean(x)

# b
n <- length(x)
t <- qt(0.025, df=n-1, lower.tail=F)
t
d <- t * sd(x) / sqrt(n)
lo <- m - t
up <- m + t
lo; up
