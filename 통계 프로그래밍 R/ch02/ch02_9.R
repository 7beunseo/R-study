### 배열
# 4 x 3 x 2 차원 배열에 1부터 24까지 값을 할당
g <- array(1:24, c(4, 3, 2))

# 각 배열에 대한 성분을 선택
g[1,,]
g[,,1]
g[,1,]

# 4차원 array
x <- array(1:120, c(5, 4, 3, 2))
