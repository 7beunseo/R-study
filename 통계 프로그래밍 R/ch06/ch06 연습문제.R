#####
# 1 #
#####

b <- read.csv("table6.5_fracture.csv", header=T)
head(b)
attach(b)

# a
t <- table(gender, fracture)

# b
aggregate(blood, list(gender), FUN="mean")
tapply(blood, gender, mean)

# c
aggregate(blood, list(fracture), FUN="mean")
tapply(blood, fracture, mean)

# d
cor(age, blood)

# e
cor(age, blood, method="spearman")

# f
boxplot(blood~gender)

# g
boxplot(blood~fracture)

# h
plot(age, blood, pch=fracture)

# i
plot(age, blood, pch=gender)


#####
# 2 #
#####


#####
# 3 #
#####
w <- c(147, 158, 131, 142, 180)
y <- c(122, 128, 125, 123, 115)
dat <- rbind(w, y)
# a
cor(w, y)

# b
cor(w, y, method="spearman")

# c
boxplot(w, y)


#####
# 4 #
#####
t <- c(40, 30, 35, 20)
f <- c(20, 30, 45, 40)
dat <- rbind(t,f)
# a
prop.table(addmargins(dat))
barplot(dat)

# b
