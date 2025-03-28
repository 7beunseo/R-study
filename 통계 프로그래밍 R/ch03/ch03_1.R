### sin 함수와 cos 함수 그리기
x <- (0:20) * pi / 10
y <- sin(x)
plot(y~x)

ycos <- cos(x)
plot(ycos~x)


### 두 개 이상의 그래프를 한 화면에 그리고 동시에 비교
par(mfrow=c(2,1))
x <- (0:20) * pi/ 10
y <- cos(x)
ysin <- sin(x)
plot(x, y)
text(3, 0, "cos(x)") # 텍스트로 출력도 가능 
plot(x, ysin)
text(5, 0.5, "sin(x)")


### matplot() 또는 lines()를 이용하여 몇 개의 그래프를 같은 좌표 평면에 그리기
x <- (0:20) * pi / 10
y <- cos(x)
ysin <- sin(x)
ysin2 <- sin(x) ^ 2

par(mfrow=c(1,2))
# yy에 한 번에 담기 
yy <- cbind(y, ysin, ysin2)

# 한 번에 그리기(matplot)
matplot(x, yy, type="pll", pch="*")

# 그린 곳에 lines()로 계속 추가하기 
plot(x, y)
lines(x, ysin, type="p", pch="*")
lines(x, ysin2)


# 그래프 조절 변수 
par(mfrow=(c(2,2)))
plot(x, y, type="p") # 점을 직음 
plot(x, y, type="l") # 선을 그림 
plot(x, y, type="b") # both 선 and 점 
plot(x, y, type="p", pch=19, col="red") # 점을 찍고, pch=19인 빨간색 점으로 그래프를 그림


# 전체 color 확인하기
colors()


### type을 사용하여 여러 가지 그래프를 그리기
op <- par(mfrow=c(2,2))

# sub을 하면 xlab 아래에 텍스트가 추가됨 
plot(x, y, type="b", main=" cosine graph", sub="type=b")

# 기본적으로 las=0, y축이 기울어진채로 있음 
# type=o -> 선과 점이 겹쳐진 형태임 
# bty -> 그래프를 그리는 상자 모양을 선택함 
plot(x, y, type="o", las=1, bty="u", sub="type=o") 

# 수직선으로 그래프를 그림 
plot(x, y, type="h", bty="7", sub="type=h")

# 계단 형으로 그래프를 그림 
plot(x, y, type="s", bty="n", sub="type=s")

# 원래의 배치로 돌아옴
par(op)


### cars 데이터를 이용하여 y=-17 + 4x 그리기
# 데이터 가져오기 
data(cars)
attach(cars)
head(cars)

mean(speed)
mean(dist)

# 그래프를 그려봅시다
par(mfrow=c(2,2))
plot(speed, dist, pch=1)
abline(v=15.4) # v=숫자 -> 수직선을 그음 (speed의 평균)

plot(speed, dist, pch=2) 
abline(h=42.98) # h=숫자 -> 수평선을 그음 (dist의 평균)

plot(speed, dist, pch=3)
abline(-17, 4) # 1차 방정식 선을 그음 

plot(speed, dist, pch=8)
# 수직선과 수평선 동시에 선을 그을 수 있음 
abline(v=15.4)
abline(h=42.98)


### 다양한 그래프 만들기
pr <- read.csv("primates.csv", header=T)
attach(pr)

# 그래프 창 띄우기 
win.graph()

# 산점도 1
plot(x=bodywt, y=brainwt, pch="*", xlab="Bodyweight",
     ylab="Brain weight", xlim=c(0, 250), ylim=c(0, 1400), sub="primates")

# 산점도 2
plot(x=bodywt, y=brainwt, type="n", xlab="Bodyweight", ylab="Brain weight")
# 400이 넘는 bodywt, brainwt만 출력 
# sum(bodywt>=400)
# sum(brainwt>=400)\
# bodywt[brainwt>=400]
# brainwt가 400 이상인 관측치에 해당하는 bodywt 값만 추출
brainwt[brainwt>=400]
points(bodywt[brainwt>=400], brainwt[brainwt>=400], pch=3)
# 400이 넘지 않는 bodywt, brainwt만 출력 
points(bodywt[brainwt<400], brainwt[brainwt<400], pch=1)
# 점과 설명을 담은 네모 박스를 출력 
legend(120, 1000, c("brain weight<=400", "brain weight>400"), pch=c(3,1))

par(mfrow=c(1,2))
plot(bodywt, brainwt, xlim=c(0, 300))
# 점에 text 찍기 
text(x=bodywt, y=brainwt, labels=animal)
plot(bodywt, brainwt, xlim=c(0, 300))
text(x=bodywt, y=brainwt, labels=animal, adj=2)
# adj=0 (점의 오른쪽에 텍스트) , adj=1 (점의 가운데에 텍스트), adj=2 (왼쪽에 텍스트)


### 그래프 좌표축에 수식 쓰기
par(mfrow=c(1,1))
p <- (1:100)/100
plot(p, sqrt(p*(1-p)), ylab=expression(sqrt(p(1-p))), type="b")

title("Standard Deviation") # main이랑 동일함 
plot(p, p*p, ylab=expression(p^2), type="l", las=1)


### 얼굴 그림
install.packages("aplpack")
library(aplpack)
data(longley)
longley
faces(longley)

# 별 그림
stars(longley)


### 윈도우창 
# 윈도우창 생성하기 
windows()
win.graph()

# 그래프를 그리기
win.graph()
plot(x, y)

win.graph()
plot(x, y)

# 모든 창 닫기기
graphics.off()

### lattice 패키지를 이용한 다양한 그래프
library(lattice)
show.settings()

# Figi 섬의 지진 데이터
data(quakes)
quakes[1:3,]

# depth 최솟값
mini <- min(quakes$depth)
# depth 최댓값 
maxi <- max(quakes$depth)
# depth 구간 크기
r <- ceiling((maxi-mini)/8) # 8개의 구간으로 나눔 
inf <- seq(mini, maxi, r) # 8개의 구간으로 자를 리스트 

# depth를 이용한 구간 만들기 
# 각 구간마다 라벨 부여 (100-150과같은)
# 562인 경우는 6에 해당함 -> 6번 인덱스 520-600에 해당함 
# floor 연산을 통해 0:7값이 생기고, 해당하는 인덱스에 매칭이 됨 
quakes$depth.cat <- factor(floor((quakes$depth - mini)/r), labels=paste(inf, inf+r, sep="-"))
quakes$depth.cat

# 경도(long) vs 위도(lat) 산점도를 depth 구간별로 나눠서 여러 개의 패널로 나눠 그림 
# 이렇게 하면 기본적인 산점도가 나옴 
# data=데이터넷 으로 사용하는 데이터셋을 지정해줌 
plot(lat ~ long, data=quakes, las=1)
# | depth.cat 범주별로 산점도를 나눔 
# plot과의 차이점 -> 조건별 다중 패널 그래프를 사용할 수 있음. ~를 사용함 
xyplot(lat ~ long | depth.cat, data=quakes, main="Figi earthquakes data") 

# cloud plot 그리기
# quakes$로 접근하거나, data= 써주기 
cloud(mag ~ lat*long, data=quakes, sub="maginutde with longitude and lattitude")

# 산점도 행렬 
splom(quakes[,1:4])
# plot(quakes[,1:4])

# 상자 그림
bwplot(mag ~ depth.cat, data=quakes, main="깊이 범주에 따른 지진 강도 상자그림")
boxplot(mag ~ depth.cat, data=quakes, main="깊이 범주에 따른 지진 강도 상자그림")


### 히스토그램과 확률밀도 추정선을 포함한 히스토그램 만들기
par(mfrow=c(1,2))
# 빈도수를 출력 (frequency)
# 막대 높이의 합 = 총 데이터 수 
hist(quakes$mag)
# 확률 밀도를 출력 (density)
# 막대 넓이의 총 합= 1
hist(quakes$mag, probability=T, main="histogram with density line")
# 자연스럽게 밀도 선과 겹침 
lines(density(quakes$mag))

# hist(quakes$lat)
# lines(density(quakes$lat))
# hist(quakes$lat, probability=T)
# lines(density(quakes$lat))


### 오렌지 나무 종류에 따라 나이와 나무 둘레 길이 데이터 셋
data(Orange)

# 나무 종류별로 나무 나이에 따른 둘레 길이 산점도
library(lattice)
head(Orange)

xyplot(circumference ~ age | Tree, data=Orange, main="Orange Trees")

# 나무 종류별로 나무 둘레 히스토그램 그리기
# hist와 다름 
histogram(~ circumference | Tree, data=Orange, main="Oragne Trees")

# 상자그림은 |를 쓰지 않고 A별 B 그림 그리기 -> B~A라고 쓰면 됨 
# 나무 종류별로 나무 둘레 상자그림을 그리기
bwplot(circumference~ Tree, data=Orange, main="Orange Trees")
# bwplot(~circumference | Tree, data=Orange, main="Orange Trees")


# 나무 종류별로 나무 나이 상자그림 그리기
bwplot(age ~ Tree, data=Orange, main="Oragne Trees")


### 산점도 행렬
data(iris)
iris[1,]

library(lattice)
splom(iris[,1:4])


### 구름 삼차원 산점도
data(iris)
library(lattice)
cloud(Sepal.Length ~ Petal.Length * Petal.Width, data=iris, main="cloud plot", sub="iris data")


### 평행선 그림
library(lattice)
data(iris)
attach(iris)
parallelplot(~iris[1:4] | Species, data=iris)


### 모자이크 그림 
library(lattice)
a <- rbind(c(50, 30), c(50, 70))
colnames(a) <- c("male", "female")
rownames(a) <- c("survive", "no survive")
mosaicplot(a, col=2:3)
