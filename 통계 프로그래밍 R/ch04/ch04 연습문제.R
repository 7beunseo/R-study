# 1
# a
rand <- rnorm(20, 3, 5)
# b
mean(rand)
sd(rand)
hist(rand)

# 2
# 포아송분포 
rand_p <- rpois(10, 3)
mean(rand_p)
hist(rand_p)

# 3
# a
qnorm(0.4, 10, 3, lower.tail=F) # false를 써야 함, 오른쪽부터 계산함  
qnrom(0.6, 10, 3, lower.tail=T) # true로 할 경우 
# b
pnorm(12, 10, 3, lower.tail=F) # 12보다 '클' 확률임 
# c
# 1 - pnorm(-11.5, 10, 3) * 2 -> 아님 
pnorm(11.5, 10, 3) - pnorm(-11.5, 10, 3)

# 4
# a
qnorm(0.05)
# b
qnorm(0.025)

# 7
# a
pt(2.5, df=10, lower.tail=F)
# b
pt(-2.5, df=10)
# c
pt(1.8, df=10, lower.tail=F) + pt(-1.8, df=10)
# d 
pt(2.5, df=10, lower.tail=F)
# e
pt(-2.5, 10)
# f
pt(1.5, 10) - pt(-1, 10)

# 8
# a
1 - ppois(2, 3)
# b
ppois(3, 3)
# c
ppois(7, 3) - ppois(1, 3)
# d
ppois(4, 3)

## 여기 다 잘못되어 있음 
# a
1 - ppois(2, lambda = 3) # P(X ≥ 3)
# ppois(3, lambda=3, lower.tail=T)
# b
ppois(3, lambda=2) # P(X <= 3)
# c
ppois(3, lambda=8) # p(X < 8)
ppois(3, lambda=2) # p(x < 2)
ppois(3, lambda=8) - ppois(3, lambda=2) # p(x < 8) - p(x < 2)
# d
ppois(3, lambda=5)

# 9
dat <- c(1.5, 2.2, 0.9, 1.3, 2.0, 1.2, 2.5, 2.7, 1.8, 2.3)
# a
hist(dat)


# d
mean(dat)
var(dat)
sd(dat)
# b
qqnorm(dat)
qqline(dat)
# c
shapiro.test(dat)
# p-value > 0.05이므로 귀무가설 채택
# d
mean(dat)
var(dat)
sd(dat)

# d연속혀에서는
P
