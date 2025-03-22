### 데이터 프레임
data("OrchardSprays")
OrchardSprays

# 데이터 프레임 -> 행렬의 일반화
# 열마다 데이터 양식(mode)를 가질 수 있음
# mode(OrchardSprays$decrease)

# read.table()을 데이터 파일을 읽어들임

### txt 파일 읽어들이기
# getwd() -> 현재 working directory 
# setwd() -> working directory 
zzz <- read.table("table2.8_test.txt", header=TRUE) # 헤더가 있으면 header=TRUE라고 해야 함. 아니면 V1, V2가 됨 
attributes(zzz)

zzz$x
zzz$x[1]
zzz[[1]]
zzz[[2]]

# 엑셀 데이터 불러오기 
# 워킹 디렉토리에서 가져오기 
zz <- read.csv("table2.8_test.csv", header=TRUE)
zz

# 전체 경로 가져오기 (\\) 역슬래시 2개 
zz <- read.csv("D:\\2025-r\\통프R\\자료 모음\\table2.8_test.csv", header=TRUE)
zz

# 전체 경로 가져오기 (/) 슬래시 1개 
zz <- read.csv("D:/2025-r/통프R/자료 모음/table2.8_test.csv")
zz

### 결과 파일 만들기 (file 인자로 저장할 txt명을 작성하기)

# 결과를 txt 파일로 저장 
cat("data set example", "\n", "x=", zzz$x, "\n", "y=", zzz$y, file="textout.txt", append=TRUE)

# 결과를 R화면에서 봄
cat("This is result", "\n", x)

mydf <- c(1, 2, 3)

# write.table 함수를 이용해서 txt 파일을 만듦 
write.table(mydf, "mydf.txt", sep=",", row.names=FALSE)

# csv 파일로 저장
write.table(mydf, "mydef.csv", sep=",", row.names=FALSE)

# 테이블 저장하기
my <- c(4, 5, 6)
mm <- cbind(mydf, my)

write.table(mm, "mydftest.csv", row.names=FALSE)

### 여러 유형의 데이터 결합
# 데이터 프레임은 2차원 이상에 데이터셋을 포현할 수 있으며, 각 행들이 다른 데이터 형식을 가질 수 있다는 점이 특징임 
# 행렬마다 데이터 특성을 수분하기 위해 rownames(), colnames()를 사용해 이름을 정할 수 있음
id <- 1:3
heros <- c('cindy', 'wendy', 'charli')
age <- c(15, 16, 14)
play_hour <- c(4, 5, 6)
team <- c(TRUE, TRUE, FALSE)
dat <- data.frame(id, heros, age, play_hour, team)
dat
