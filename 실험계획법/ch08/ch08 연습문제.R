#####
# 7 #
#####

y7 <- c(96.9, 125.7, 43.5, 22.4, 14.1, 9.5, 28.8, 52.5)
a7 <- as.factor(c(1, 1, 0, 0, 0, 0, 1, 1))
b7 <- as.factor(c(0, 1, 0, 1, 0, 1, 0, 1))
c7 <- as.factor(c(0, 0, 0, 0, 1, 1, 1, 1))
d7 <- as.factor(c(0, 9, 1, 1, 0, 0, 1, 1))

data.frame(y7, a7, b7, c7)
L7 <- aov(y7~a7+b7+c7+d7)
summary(L7)
L7 <- aov(y7~a7*b7*c7*b7)
summary(L7)
anova(L7)
L7 <- aov(y7 ~ a7 + b7 + c7 + d7 + 
            a7:b7 + a7:c7 + a7:d7 + 
            b7:c7 + b7:d7 + 
            c7:d7)
summary(L7)

# 주효과 구하기 
tapply(y7, a7, mean)
