# 1
# 1-a
rand <- rnorm(20, mean=3, sd=5)
# 1-b
mean(rand)
sd(rand)
# 1-c
hist(rand)

# 2
# 2-a
rand_p <- rpois(10, lambda=3)
# 2-b
mean(rand_p)
sd(rand_p)
# 3-b
hist(rand_p)

# 3
# 3-a
qnorm(0.4, mean=10, sd=3)
# 3-b
pnorm(12, mean=10, sd=3)
# 3-c
pnorm(11.5, mean=10, sd=3) - pnorm(-11.5, mean=10, sd=3)

# 4
# 4-a
pnorm(0.05)
# 4-b
pnorm(0.025)

# 5
dbinom(3, size=5, prob=1/6)

# 6
# 모르겠음 

# 7
# 7-a
1 - pt(2.5, df=10)
# 7-b
pt(-2.5, df=10)
# 7-c
pt(-1.8, df=10) + pt(1.8, df=10, lower.tail=F)
# 7-d
pt(2.5, df=10)
# 7-e
pt(-2.5, df=10)
# 7-f
pt(1.5, df=10) - pt(-1, df=10)

# 8
# 8-a
ppois(2, lambda=3, lower.tail=F)
+1 - ppois(2, lambda=3)
# 8-b
ppois(3, lambda=3)
# 8-c
ppois(7, lambda=3) - ppois(1, lambda=3)
# 8-d
ppois(4, lambda=3)

# 9
dat <- c(1.5, 2.2, 0.9, 1.3, 2.0, 1.2, 2.5, 2.7, 1.8, 2.3)
# 9-a
hist(dat)
# 9-b
qqnorm(dat)
qqline(dat)
# 9-c
shapiro.test(dat)
# 9-d
mean(dat)
var(dat)
sd(dat)

# 10
height <- c(
  182, 167, 166, 159, 178,
  176, 169, 163, 166, 181,
  171, 182, 172, 186, 171,
  166, 170, 168, 154, 173,
  174, 166, 160, 162, 161,
  179, 147, 162, 170, 166,
  165, 178, 171, 169, 183,
  149, 168, 177, 170, 163
)
# 10-a
mean(height)
var(height)
sd(height)
range(height)
# 10-b
hist(height, probability = T)
lines(density(height))
#10-c
qqnorm(height)
qqline(height)

# 11
# 11-a
uniform_1 <- rnorm(30, 0, sqrt(2))
# 11-b
m <- rep(0, 50)
for(i in 1:50) {
  uniform <- rnorm(50, 0, sqrt(2))
  m[i] <- mean(uniform)
}
hist(m)
# 11-c
qqnorm(m)
qqline(m)
# 11-d
y <- rpois(30, lambda=3)
# 11-e
mp <- rep(0, 50)
for(i in 1:50){
  uniform <- rpois(30, lambda = 3)
  mp[i] <- mean(uniform)
}
hist(mp)
# 11-f
qqnorm(mp)
qqline(mp)

height
table(height)
