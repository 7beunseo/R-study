# 카이제곱 검정
# H0 : 2개의 범주형 변수간에 독립이다.
# H1 : 2개의 범주형 변수간에 독립이 아니다.
# 두 변수간에 table, matrix 형태가 입력으로 들어옴 
# 혹은 분포와 확률 

# 데이터가 빈도로 주어진 경우
data <- cbind(c(54, 63), c(45, 65))
data
chi <- chisq.test(data)
chi
# -value = 0.5077
# 귀무가설을 기각하지 못함 -> 2개의 범주형 변수간에 독립이다.

attributes(chi)

# 실제 값 출력 
chi$observed

# 기대도수
chi$expected

# 잔차
chi$residuals


# 데이터가 개체에 대한 정보로 주어진 경우 
x <- seq(1, 12)
gender <- c("M", "M", "M", "M", "M", "M", "F", "F", "F", "F", "F", "M")
admit <- c("Y", "Y", "Y", "Y", "Y", "N", "Y", "Y", "Y", "N", "N", "Y")

table(gender,admit)
chisq.test(table(gender, admit))
# p-value = 0.7353
# 귀무가설 기각하지 못함. 성별과 입학 여부는 독립이다. 


data_matrix <- matrix(c(
  20, 30, 20, 25, 30,  # 음주 1
  20, 20, 35, 37, 31,  # 음주 2
  16, 29, 40, 45, 30,  # 음주 3
  9, 10, 35, 37, 31,  # 음주 4
  10, 10, 26, 39, 40   # 음주 5
), 
nrow = 5, byrow = TRUE)
data_matrix

# H0 : 흡연 빈도 수준과 음주 빈도 수준은 독립이다.
chisq.test(data_matrix)
# p-value = 0.002149
# 귀무가설 기각. 흡연 빈도 수준과 음주 빈도 수준은 서로 독립이 아니다. 

########################
# 카이제곱 적합도 검정 #
########################

y <- c(30, 20, 27, 23)
chisq.test(y)
prop <- rep(1/length(y), length(y))
chisq.test(y, p=prop) # 같은 확률 분포일 경우에는 porp 전달할 필요 없음 
# p-value = 0.5087 귀무가설을 기각하지 못하므로 균일 분포를 따른다고 할 수 있다. 


library(UsingR)
data("pi2000")

table(pi2000)

chisq.test(table(pi2000))
# p-value = 0.8817
# 귀무가설을 기각하지 못한다. -> 각 숫자의 발생 확률이 동일하다고 할 수 있다. 


data(samhda)
attach(samhda)
y <- table(amt.smoke[amt.smoke < 98])
# 빈도를 지정해줌
p <- c(0.2, 0.15, 0.05, 0.05, 0.1, 0.15, 0.3)
sum(p) # 확률값의 총합은 1이어야 함 
chisq.test(y, p=p)
# p-value = 1.719e-09
# 귀무가설 기각. 각 범주의 확률이 주어진 상황과 같다고 할 수 없음 


z <- table(amt.alcohol[amt.alcohol < 98])
pz <- c(0.01, 0.04, 0.05, 0.1, 0.1, 0.3, 0.4)
a <- chisq.test(z, p=pz)
# p-value = 0.00686
# 귀무가설 기각. 각 범주의 확률이 주어진 상황과 같다고 할 수 없음 

a$expected # 기대도수 출력하기 
