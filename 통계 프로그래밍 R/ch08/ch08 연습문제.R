#####
# 1 #
#####

data <- cbind(c(30, 30), c(10, 10))
data

# a
chisq.test(data)
# p-value = 1
# 입학 여부와 성별 간에 관계가 있다고 할 수 없다.


#####
# 2 #
#####

data <- cbind(c(30, 30), c(20, 10))
chisq.test(data)

# p-value = 0.2023
# 귀무가설을 기각할 수 없음 -> 입학 여부와 성별간에 관계가 있다고 할 수 없다. 


#####
# 3 #
#####

data <- rbind(c(40, 30, 35, 20), c(20, 30, 45, 40))
data

chisq.test(data)
# p-value = 0.002621
# 귀무가설 기각. 학년과 참석 여부가 독립이 아니다.


#####
# 4 #
#####

res <- c(30, 20, 40, 10, 40, 60)
p <- rep(1/6, 6)
chisq.test(res)
# p-value = 9.082e-09
# 귀무가설 기각. 각 수가 나올 확률이 모두 1/6이 아님 
chisq.test(res, p=p)


#####
# 5 #
#####

data <- c(53, 42, 51, 45, 36, 37, 65)
chisq.test(data)
# p-value = 0.03824
# 귀무가설 기각 - 요일별 살인 사건 발생 확률이 같다고 할 수 없다.


#####
# 6 #
#####

data <- cbind(c(60, 5), c(10, 20))
data

# a
chisq.test(data)
# p-value = 5.989e-09
# 귀무가설 기각. 독립이라고 할 수 없음 

# b
c <- chisq.test(data)
c$expected
# [,1]      [,2]
# [1,] 47.89474 22.105263
# [2,] 17.10526  7.894737


#####
# 7 #
#####

# 학생번호
id <- 1:14

# 성별
gender <- c("M", "M", "M", "M", "M", "M", "F", "F", "F", "F", "F", "F", "F", "F")

# 수강결과
result <- c("P", "P", "F", "F", "P", "F", "P", "F", "F", "P", "F", "P", "P", "F")

chisq.test(gender, result)
# p-value = 1
# 관계가 없다


#####
# 8 #
#####

data <- c(20, 55, 30)
chisq.test(data)
# p-value = 9.274e-05
# 분포가 동일하다고 할 수 없다.


#####
# 9 #
#####

data <- cbind(c(27, 7), c(18, 10))

# a
prop.table(data)

# b
d <- chisq.test(data)
d$expected
d$residuals

# c
# p-value = 0.2971
# 귀무가설을 기각하지 못함. 독립이다. 


######
# 10 #
######

vote_matrix <- matrix(c(
  115, 395,  # 진보: 이회창, 노무현
  169, 221,  # 중도: 이회창, 노무현
  225, 125   # 보수: 이회창, 노무현
), 
nrow = 3, byrow = TRUE)

chisq.test(vote_matrix)
# p-value < 2.2e-16
# 귀무가설 기각. 대통령 후보와 이념성향이 독ㄹ비이 아니다.


######
# 11 #
######

buy_matrix <- matrix(c(
  24, 20, 50,   # 안하겠다
  32, 30, 20,   # 고려해보겠다
  54, 60, 15    # 하겠다
), 
nrow = 3, byrow = TRUE)

chisq.test(buy_matrix)
# p-value = 9.014e-10
# 여성 나이대와 구매 여부가 독립이다. 