# 1
# 1.1 
sqrt( sqrt(120) + sqrt(15) + 3^4 ) / 10
# 1.2
x <- 1
y <- 2
z <- 3
log((3 * x + y) ^ z, base=10)

# 2
# 2.1
d <- rnorm(10, mean=10, sd=2)
d
# 2.2
mean(d)
sd(d)
# 2.3
qqnorm(d)
qqline(d)
# 2.4
min(d)
max(d)
sum(d^2)
# 2.5
xgrid <- seq(1, 10, length=10)
plot(xgrid, d)

# 3
x <- seq(0, 1, length=100)
y <- log(x)
z <- sqrt(x)
w <- rep(1, 100)
matplot(x, cbind(y, z, w), type=c("b", "h", "o"), pch=c(1, 2, 3) ) # 꼭 cbind로 해주어야 함! 

# 3.1
plot(x, y)
# 3.2
plot(x, y, type="l")
lines(x, z, col="red")
lines(x, w) # ?? 

# 4
# 4.1
sum <- 0
x <- 5:10
for(i in 5:10) {
  sum <- sum + (2^(pi * i))  
}
sum
# 4.2
sum(2 ^ (pi * x))

# 5
abs((2 * 2 + (-1) * 5)) / sqrt((2 ^ 2 + (-1) ^ 2))

# 6
# 6.1
pnorm(3)
# 6.2
qnorm(-1.5) * 2
# 6.3
qnorm(0.95)

# 7
# 7.1
m <- read.csv("midterm.csv", header=T)
f <- read.csv("final.csv", header=T)
h <- read.csv("homework.csv", header=T)
# 7.2
head(m); head(f); head(h)
mean(m$mid); sd(m$mid)
mean(f$final); sd(f$final)
mean(h$homework); sd(h$homework)
# 7.3
data <- merge(m, f, by.x = "name", by.y="name", all=T)
data <- merge(data, h, by.x="name", by.y="name", all=T)
data
# 7.4
score <- data$mid * 0.4 + data$final * 0.45 + data$homework * 0.15
names(score) <- data$name
score
# 7.5
names(score[score==min(score)]); min(score)
names(score[score==max(score)]); max(score)
# 7.6
for(i in score) {
  if (i >= 90) {
    cat("A", i, names(score[score==i]), "\n")
  }
  else if (i >= 80) {
    cat("B", i, names(score[score==i]), "\n")
    
  }
  else {
    cat("C", i, names(score[score==i]),"\n")
    
  }
}
# 7.7
score
score <- score[order(score)]
for(i in 1:length(score)) {
  cat(score[i], names(score[score==score[i]]), i, "\n")
}
# 7.8
cha <- data$mid - data$final
cha
cha <- cha[order(-cha)]
cha
mean(cha)
# 8
data(trees)
head(trees)
# 8.1
new_frame <- trees[(trees$Height>=70 & trees$Volume>17),]
new_frame
trees
# 8.2
length(new_frame$Girth)
mean(new_frame$Girth)

# 7번 문제 data frame 이용해서 수정

# 7.4
data$score <- data$mid * 0.4 + data$final * 0.45 + data$homework * 0.15 # 아예 score 필드를 새롭게 추가함 
data

# 7.5
data[data$score == min(data$score),]
data[data$score == max(data$score),]

# 7.6
for(i in 1:length(data$score)) {
  # 학생 가져오기 
  stud <- data[i,]
  name <- stud$name
  score <- stud$score
  degree <- ""
  if(score >= 90) degree <- "A"
  else if (score >= 80) degree <- "B"
  else degree <- "C"
  cat(name, score, degree, "\n")
}

# 7.7
data$rank <- rank(-data$score) # 내림차순으로 
data

# 7.8
data$rank <- rank(-data$score) # 내림차순으로 
data[,c(1, 5, 6)]

# 7.9
data$sub <- data$final - data$mid
data[order(-data$sub),] # 증가가 큰 순부터 작은 순으로 정렬 
mean(data$sub) # 점수 차이의 평균 
