#####
# 1 #
#####

# 
# 주구 -> mix (3요인)
# 분할구 -> temperature (5요인)

Y <- c(
  47, 29, 35, 47, 57,
  35, 46, 47, 39, 52,
  43, 43, 43, 46, 47,
  26, 28, 32, 25, 37,
  21, 21, 28, 26, 27,
  21, 28, 25, 25, 31
)
temp <- as.factor(rep(rep(c(175, 185, 195, 205, 215)), 6))
mix <- as.factor(rep(rep(1:3, each=5), 2))
rep <- as.factor(rep(1:2, each=15))
data <- data.frame(Y, temp, mix, rep)
aov.1 <- aov(Y~mix*temp+Error(rep/mix/temp))
summary(aov.1)

# SSwp = 22.07
# SSwpe = 49.40

# SSsp = 364.9
# SSspxwp = 215.9
# SSspe = 303.6

# mix는 유의하지 않음
# temp는 유의함 
# mix와 temp의 상호작용효과는 유의하지 않음 


#####
# 2 #
#####

# 주구 Humidity (3요인)
# 분할구 Strips (2요인)
# 2반복 

Y <- c(
  1.12, 3.50, 1.00,
  1.13, 0.75, 0.50,
  1.75, 1.75, 1.50,
  5.25, 1.62, 1.50
)

Humidity <- as.factor(rep(c(50, 70, 90), 4))
Strips <- as.factor(rep(rep(c(1:2), each=3), 2))
rep <- as.factor(rep(1:2, each=6))
data <- data.frame(Y, Humidity, Strips, rep)

aov <- aov(Y~Humidity*Strips+Error(rep/Humidity/Strips))
summary(aov)

# SSwp = 2.913
# SSwpe = 3.994

# SSsp = 0.001
# SSspxwp = 5.215
# SSspe = 4.824

# 모든 주구, 분할구, 주구 분할구 효과가 유의하지 않다. 


#####
# 3 #
#####

# 주구 온도 (3요인)
# 분할구 압력 (3요인)
# 분할 분할구 동력 (3요인)
# 반복 2 

Y <- c(
  146, 202, 264, 189, 229, 298, 181, 225, 267,
  141, 212, 258, 160, 228, 323, 182, 253, 330,
  133, 180, 247, 159, 184, 250, 173, 199, 270,
  167, 212, 258, 188, 231, 311, 180, 222, 264,
  147, 197, 259, 154, 224, 334, 178, 250, 331,
  120, 177, 242, 160, 189, 242, 174, 201, 276
)

pressure <- as.factor(rep(rep(1:3, each=3), 6))
power <- as.factor(rep(rep(1:3, 3), 6))
temp <- as.factor(rep(rep(1:3, each=9), 2))
rep <- as.factor(rep(1:2, each=27))
data <- data.frame(Y, pressure, power, temp, rep)
aov <- aov(Y~temp*pressure*power+Error(rep/temp/pressure/power))
summary(aov)

# SSwp = 10521
# SSwpe = 77 

# SSsp = 11195 
# SSspxwp = 3532
# SSspe = 172

# SSssp = 122552
# SSsspxwp = 4107
# SSsspxsp = 752
# SSsspxspxwp = 2581
# SSsspe = 533

# 주구, 분할구, 주구 분할구 상호작용 효과, 분할 분할구, 주구 분할 분할구 상호작용, 분할구 분할 분할구 상호작용, 주구 분할구 분할 분할구 상호작용 효과가 유의하다 