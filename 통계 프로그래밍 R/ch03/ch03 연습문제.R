# 1번
# a
x <- seq(-1, 1, length=100)
# b
plot(x, x^2, pch="*")
# c
plot(x, x^2, col="red", type="l")

# 2번
x <- seq(0, 5, length=100)
y1 <- x
y2 <- x ^ 2
y3 <- log(x)
y4 <- sqrt(x)
# a
par(mfrow=c(2,2))
plot(x, y1)
plot(x, y2)
plot(x, y3)
plot(x, y4)
# b
par(mfrow=c(1,1))
yy <- cbind(y1, y2, y3, y4)
matplot(x, yy, type="l")
# c
plot(x, y1)
lines(x, y2, type="l")
lines(x, y3, type="b")
lines(x, y4, type="b")

# 3번
x <- seq(-pi, pi, length=100)
plot(x, sin(x))
lines(x, cos(x))
lines(x, tan(x), col="red")

# 4번
install.packages("UsingR")
library(UsingR)
data(primes)
hist(primes)
histogram(primes)

# 5번
# a
x <- seq(-3, 3, length=100)
e <- expression((1 / sqrt(2 * pi)) ^(-1 / 2 * x ^ 2))
y <- (1 / sqrt(2 * pi)) ^(-1 / 2 * x ^ 2)
plot(x, y, main=e)
# b
eb <- expression(exp(abs(x))
y <- exp(abs(x))
plot(x, y, main=eb)

# 6번
x <- seq(0, 5, length=100)
delta <- c(0.5, 1, 2)
e <- expression(delta * exp(-1 * delta * x))
y <- delta * exp(-1 * delta * x)
### ? 모르겠음 !!

# 7번
p <- rep(1/6, 6)
x <- 1:6
barplot(p, probability=T, ylim=c(0,1))
# lines(density(p))

# 10번
data("OrchardSprays")
head(OrchardSprays)
# a
xyplot(colpos~decrease | treatment, data=OrchardSprays)
# b
mean(OrchardSprays$decrease)
var(OrchardSprays$decrease)
# c
bwplot(OrchardSprays$decrease)
# d
splom(OrchardSprays[c(1,3)], xlab="OrchardSprays")

# 11번

# 12번
a <- data.frame(
  stretch=c(46, 54, 48, 50, 44, 42, 52),
  distance=c(183, 217, 189, 208, 178, 150, 249)
)
a$group <- a
b <- data.frame(
  stretch=c(25, 45, 35, 40, 55, 60),
  distance=c(71, 196, 127, 187, 249, 291)
)
b$group <- b
ab <- rbind(a, b)
splom(~ab, pch=c('a', 'b'), groups<-ab$group)


