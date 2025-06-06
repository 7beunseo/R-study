group = rep(1:5,each=4)
y = c(2.4, 2.7, 3.1, 3.1, 0.7, 1.6, 1.7, 1.8, 2.4, 3.1, 
      5.4, 6.1, 0.3, 0.3, 2.4, 2.7, 0.5, 0.9, 1.4, 2.0)
# y <- c(2.3, 0.7, 2.4, 0.3, 0.5 ... )
# 세로로 입력할수도 있음
# 그러나 factor의 수준을 나타내ㄴ는 gorup도
# group < c(1, 2, 3 4, 5, 1, 2, 3, 4, 5)
# 순서에 맞춰서 잘 작성해주어야 함
# 데이터를 입력하는 방향은 상관이 없음
# 각각의 데이터들이 어떤데이터인지만 잘 표현할 수 있으면 데이터에 입력한 순서는 중요하지 않음 
# 입력한 데이터가 제대로 된 ㄷ이터인가? 

sol = cbind(group, y)
group = as.factor(group)

# 분산 분석 진행 
# 반응변수를 왼쪽,설명 변수를 오른쪽에 넣음 
# 데이터 변수~그룹 변수

aov1 = aov(y~group)
summary(aov1)

plot(y~group)
