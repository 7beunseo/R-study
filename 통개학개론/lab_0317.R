### 범주형 자료 : 동호인 마을, 도수분포표, 막대그래프, 파이그림

# 번주형 자료
동호인마을 <- c('음악', '미술', '미술', '영화', '역술', '음악', '음악', '영화', '미술', '영화', '미술', '음악', '음악')

# 도수분포표로 만들기
freq_table <- table(동호인마을)

# 막대그래프 그리기
barplot(freq_table)
barplot(freq_table, col="coral", xlab="동호인마을", ylab="명", main="동호인마을")

# 원 그래프 그리기
pie(freq_table)

# 도수분포표 출력
print(freq_table)


### 수치형 자료

weight= c(55.6, 57.4, 59.4, 60.7, 60.8, 60.9, 61.0, 62.5, 62.5, 62.6,
          63.2, 63.2, 63.3, 63.5, 63.5, 63.6, 63.6, 63.6, 63.7, 63.8,
          64.0, 64.1, 64.2, 64.4, 64.5, 64.5, 64.6, 65.2, 65.5, 65.5,
          65.5, 65.7, 65.7, 65.9, 66.2, 66.3, 66.7, 66.7, 66.7, 66.9,
          67.0, 67.1, 67.2, 67.6, 67.8, 67.8, 68.1, 68.4, 68.5, 68.5,
          68.5, 68.6, 68.9, 69.2, 69.2, 69.4, 69.4, 69.4, 69.6, 69.6,
          69.7, 69.9, 70.4, 70.5, 71.0, 71.1, 71.1, 71.2, 71.2, 71.5,
          71.5, 71.5, 71.5, 71.6, 71.7, 71.9, 71.9, 71.9, 72.4, 72.6,
          72.7, 72.8, 72.9, 73.0, 73.0, 73.2, 73.5, 73.9, 74.2, 74.2,
          74.6, 74.9, 75.0, 75.5, 75.7, 75.8, 77.3, 80.7, 80.8, 83.0)

# 수치형 자료는 히스토그램 -> 바로 벡터를 넣음 
hist(weight)

# 수치형 자료 요약
summary(weight)

# 상자그림
boxplot(weight)

# 이상치 표시하지 않음 
boxplot(weight, outline = F)


### 산점도
data(iris)
head(iris)

# 산점도 그리기
x <- iris$Petal.Length
y <- iris$Sepal.Width
plot(x, y)

# 산점도 모양 바꾸기
plot(x, y, pch="+")

iris[,1:4] # 열은 총 5개 있는데 Species만 뺌 

# 쌍으로 주어진 데이터에서 산점도를 그림
plot(iris[,1:4])

# 색을 원래 데이터, 각각 종류를 이용해서 색을 다르게 표현 하고 싶다면?
pairs(iris[,1:4], pch=19, col=iris$Species) # 종을 col에 넣음 


### 데이터 불러오기 
insurance <- read.csv("insurance.csv", header=T)
head(insurance)

# working directory 확인하기
getwd()
# working directory 세팅하기
setwd("")

# Claims 분석 진행

# 최솟값 
min(insurance$Claims)

# 최댓값
max(insurance$Claims)

# 계급을 나눔 
# 최댓값부터 최솟값까지 50개의 sequence를 만듦 
seq(0, 400, 50)
cut(insurance$Claims, breaks=seq(0, 400, 50), include.lowest = T)
# include.lowest = T을 함으로서 원래는 (] (왼쪽 포함 안 함, 오른쪽 포함함) 인데 가장 최솟값에 [] 값을 포함해줌 
cutclaims <- cut(insurance$Claims, breaks=seq(min(insurance$Claims), max(insurance$Claims), 50), include.lowest = T)

# 도수분포표를 만듦
insuracne_table <- table(cutclaims)
names(insuracne_table) <- c("0-50", "50-100", "150-200", "200-250", "250-300", "300-350", "350-400")
insuracne_table
# names(insuracne_table)[[1]] <- "test" (이름변경)

# 박스그림
boxplot(insuracne_table)
boxplot(insuracne_table, outline=F)


### 초능력 데이터 불러오기
data <- read.csv("초능력.csv", header=T, fileEncoding = "cp949")

# 분할표 그리기
table(data$부류, data$초능력)

# 모자이크 그림 그리기
crosstab <- table(data$부류, data$초능력)
# 안에 분할표 넣어주고, 색상 지정 
mosaicplot(crosstab, col=c("red", "blue"))
