#####
# 1 #
#####

# 완전화률화 블록 설계 
y <- c(
  15, 20, 13, 16,  # 1행 (블록 1)
  11, 20, 15, 18,  # 2행 (블록 2)
  10, 22, 17, 15,  # 3행 (블록 3)
  12, 19, 13, 17   # 4행 (블록 4)
)

block <- as.factor(rep(1:4, each=4))
trt <- as.factor(rep(1:4, 4))
data.frame(y, trt, block)

# 2
tapply(y, trt, mean)
tapply(y, trt, sd)

# 3
plot(y~trt)

# 4
aov1 <- aov(y~trt+block)
summary(aov1)

1 - pf(13.219, 3, 9)
1 - pf(0.153, 3, 9)

# 5
pairwise.t.test(y, trt, p.adjust="none")


#####
# 2 #
#####

y <- c(
  175,  95, 180, 170, 155,   # 1행 (실험일 1)
  190, 185, 180, 200, 190,   # 2행 (실험일 2)
  185, 165, 175, 195, 200    # 3행 (실험일 3)
)

trt <- as.factor(rep(1:5, 3))
block <- as.factor(rep(1:3, each=5)) # 조심

data.frame(y, trt, block)

# 2
tapply(y, trt, mean)
tapply(y, trt, sd)

# 3
boxplot(y~trt)
boxplot(y~block)

# 4
aov2 <- aov(y~trt+block)
summary(aov2)

# 5
pairwise.t.test(y, trt, p.adjust="none")


#####
# 3 #
#####

y <- c(
  15, 20, 13,      # 1행 (오븐 1)
  11, 20, 12,      # 2행 (오븐 2)
  10, 17, 12,      # 3행 (오븐 3)
  21, 13, 17       # 4행 (오븐 4)
)

trt <- as.factor(c(1, 2, 3, 1, 2, 4, 1, 3, 4, 2, 3, 4))
block <- as.factor(rep(1:4, each=3))
data.frame(y, trt, block)

# 2
tapply(y, trt, mean)
tapply(y, trt, sd)

# 3
plot(y~trt)
plot(y~block)

# 4
aov3 <- aov(y~trt+block)
summary(aov3)

# 5
pairwise.t.test(y, trt, p.adjust="none")
