### 데이터가 어떤 타입인지 확인하기

```r
score <- 1:5
class(score)
typeof(score)
mode(score)
```

### length는 전체 원소의 개수를 출력
```text
      x1 x2
 [1,]  3  4
 [2,]  3  3
 [3,]  3  2
 [4,]  3  1
 [5,]  3  2
 [6,]  3  3
 [7,]  3  4
 [8,]  3  5
 [9,]  3  6
[10,]  3  7
[11,]  3  8
```
```r
length(x)
```
* 전체 원소의 개수인 22가 나옴 (11이 아님)

### col, row 이름 지정하기
```R
# 한 번에 전체 바꾸기 
rownames(x) <- letters[1:11]
# 하나만 바꾸기 (인덱싱 처리하기)
rownames(x)[1] <- "z"
```

### 데이터프레임에서 특정 조건만 출력
```R
# 특정 조건을 만족하는 데이터만 뽑는다 = 행만 선별해서 뽑고 모든 열을 출력한다
cabbages[Date == "d16"] # 오류, 행과 열을 정의해주지 않음
cabbages[Date == "d16", ] # 콤마를 찍어 열은 어떻게 출력할 것인지를 지정해야 함
# 두 개의 조건이 있는 경우는 괄호 쳐서 연결하기
cabbages[(Date=="d16" & VitC >= 60),]
```

### 데이터 순서 정렬
```R
da <- cbind(id=1:5, a=c(4, 9, 7, 2, 8))

# 벡터 a의 성분값을 순서대로 배열
sort(a)

# a 값 순서대로 개체별 데이터를 재배열 order() 함수 사용
da[order(a), ] # 뒤에 콤마를 써 줘야 모든 데이터가 나옴

# 벡터 a 성분 값에 순위값을 주고자 할 때
x <- c(11, 24, 24, 30, 30, 30)
rank(x) # 동점이면 소숫점으로 동일하게 표시 (평균 순위)

# x 값에 순서를 주고자 할 때 (동점은 상관없이 단순히 인덱스 순으로 나열)
order(x)
```

### 벡터에서 특정 값 걸러 보기 (인덱싱으로)
```R
x <- c(100, 120, 130, 124, 150, 167, 170, 163, 160, 155, 145, 157)
# 벡터에서 첫 번째 값만 제거한 벡터
xm1 <- x[-1]
# 첫 번째와 열 두 번째 데이터 값을 제거한 벡터
xm2 <- x[c(-1, -12)]
# 데이터 값이 150이 아닌 경우만
xx <- x[x!=150]
# 데이터 값이 150 이상인 경우만
xp <- x[x>=150]
```

### 벡터 - 각 성분의 곱
```r
x * x
y * x
# 불가능한 연산이지만, R에서는 각 성분들의 곱으로 반환해줌
```

### 행렬의 차원 구하기
```r
dim(x)
# 2 5 -> 2행 5열
```

### 결측값 
```R
# 결측값이 있는 데이터
x <- c(-1, -2, -3, 4, 5)
# 2보다 큰 값을 출력하면 NA도 포함됨
x[x>2]
# 결측치를 제외하고 평균 구하기 -> na.rm=T
mean(x, na.rm=T)
# 결측값을 제외한 데이터 벡터 생성
na.omit(x)
# 결측값에 순위 주기 - 결측값은 맨 마지막 순위를 받음
rank(x)
# 기본적으로 na.last=T임
rank(x, na.last=T)
# 결측값에 가장 작은 순위를 줌
rank(x, na.last=F)
```

### 데이터 프레임
```R
# 데이터 프레임은 각 열마다 각각 다른 데이터 양식을 가질 수 있음 
# read.table()로 읽어들인 경우 데이터 프레임이 자동으로 생성됨
# 파일 첫 줄에 변수명이 있으면 header=T, 변수명이 없으면 header=F 옵션을 써서 읽음
tab <- read.table("table2.8_test.txt", header=T)
attributes(tab) # 데이터 프레임 형식 확인하기
```

### 파일로 저장하기
```R
# cat 
cat("result", file="resulttt.txt")

mydf <- c(1, 2, 3)
# write.table
write.table(mydf, "mydefff.txt", row.names=F) # 열 번호가 나오지 않음, txt에서는 col.names=F도 할 수 있음 
# write.csv
write.csv(mydf, "mydefff.csv", row.names=F)

my <- c(4, 5, 6)
mm <- cbind(mydf, my)
write.csv(mm, "mm.csv", row.names=F)
```

### dataframe 데이터셋 합치기
```R
authors <- data.frame(
  surname = I(c("Turkey", "venables", "Tiserney", "Ripley", "McNeil")),
  nationality = c("US", "Australia", "US", "UK", "Australia")
)

books <- data.frame(
  name = I(c("Turkey", "venables", "Tiserney", "Ripley", "McNeil")),
  year = c(1976, 1995, 1996, 1998, 2000)
)

d<-merge(authors, books, by.x="surname", by.y="name")
# 반드시 by.x, by.y로 합쳐주기

# 만약 데이터셋의 크기가 맞지 않는다면? -> books에 KIm이 추가된 상황 
books <- data.frame(
  name = I(c("Turkey", "venables", "Tiserney", "Ripley", "McNeil", "Kim")),
  year = c(1976, 1995, 1996, 1998, 2000, 2008)
)

d<-merge(authors, books, by.x="surname", by.y="name", all=T)
# all=T 옵션을 줘서 일치하지 않더라도 <NA> 로 연결하도록 함
# all=T 옵션을 주지 않으면 결측값을 포함한 경우는 제외되고 출력됨 
```

### 객체
```r
x <- 1:4
y <- 2:4
# list에 이름 지정하지 않고 생성
L1 <- list(x, y)
# 아래처럼 접근해야 함 
L1[[1]]
L1[[2]]
# A, B 이름을 지정하여 리스트 생성
L2 <- list(A=x, B=y)
# A, B 이름으로 접근
L2$A
L2$B
```

### 시계열 데이터
```R
ts(1:10, start=2001)
```

### 수식 
```r
x <- 3; y <- 2.5; z <- 1
# 수식 객체 만들기
exp1 <- expression(x / (y + exp(z)))
# 수식 계산
eval(exp1)
```
