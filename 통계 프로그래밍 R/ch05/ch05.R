# 범주형 데이터

# 분할표 table()
res <- c("y", "n", "y", "y", "y", "n", "n", "y", "y", "y")
table(res)

# 막대그래프
barplot(table(res))
# 막대그래프 기울이기
barplot(table(res), horiz = T)

# 파이그림
pie(table(res))

# 점그림
dotchart(table(res))
# 연속형 데이터의 점 그림
sales <- c(50, 39, 47, 45)
names(sales) <- c("Amy", "John", "Jack", "Lisa")
dotchart(sales)


# 줄기 잎 그림
x <- c(45, 86, 34, 98, 67, 78, 56, 45, 85, 75, 64, 75, 75, 75, 58, 45, 83, 74)
stem(x)
# 스케일을 늘려줌
stem(x, scale=2)

# 상자그림
boxplot(x, main="Box plot")
boxplot(x, horizontal = T, main="Box plot")

# 히스토그램
hist(x)
hist(x, breaks=8)
# 확률밀도함수
hist(x, probability = T)
lines(density(x))

# 평균값
mean(x)
median(x)

# 분산
var(x)
sd(x)
quantile(x, 0.25)
range(x)
summary(x)

# 표준화 점수
y <- c(2, 5, 7, 9, 3)
scale(y)
(y - mean(y)) / sd(y)
# round로 결과 반올림
round(scale(y), 2)
# 표준화 점수의 평균과 표준편차
mean(scale(y)) # 거의 0
sd(scale(y)) # 거의 1 

# 신뢰 구간 

