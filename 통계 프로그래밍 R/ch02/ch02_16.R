### 데이터셋 합치기 
authors <- data.frame(
  surname = I(c("Turkey", "venables", "Tiserney", "Ripley", "McNeil")),
  nationality = c("US", "Australia", "US", "UK", "Australia")
)

books <- data.frame(
  name = I(c("Turkey", "venables", "Tiserney", "Ripley", "McNeil")),
  year = c(1976, 1995, 1996, 1998, 2000)
)

authors
books

# 데이터셋 합치기
d <- merge(authors, books, by.x="surname", by.y="name")
d

# 데이터셋의 크기가 다른 경우
books2 <- data.frame(
  name = I(c("Turkey", "venables", "Tiserney", "Ripley", "McNeil", "Kim")),
  year = c(1976, 1995, 1996, 1998, 2000, 2008)
)

# all=TRUE 옵션을 쓰지 않으면 결측값을 포함한 경우는 제외되고 정렬됨 
d2 <- merge(authors, books2, by.x="surname", by.y="name")
d2 # kim은 포함되지 않음 
d3 <- merge(authors, books2, by.x="surname", by.y="name", all=TRUE)
d3 # kim 포함됨, 대신 nationality는 NA로 뜸 