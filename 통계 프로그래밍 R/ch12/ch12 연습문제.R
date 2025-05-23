# 참고
View(dia_df %>% filter(cut == "Ideal" | cut == "Premium"))
# 결과를 View로 감싸면 뷰어 창에서 확인할 수 있음!


#####
# 1 #
#####

data(diamonds, package="ggplot2")
head(diamonds)

# a
dim(diamonds)

# b
dia_df <- as_tibble(diamonds)
dia_df

# c
dia_df %>% filter(cut=="Ideal")
diamonds %>% filter(cut=="Ideal")

# d
dia_df |>
  filter(cut=="Ideal" | cut=="Premium")

# f
dia_df |>
  arrange(desc(price))

diamonds |>
  arrange(desc(price))

# g
dia_df |>
  mutate(total = x + y + z)


#####
# 2 #
#####

library(dplyr)
install.packages("hflights")
# 없다고 나오면 깔기 ^^
library(hflights)
data("hflights")
hflights[1,]

# a
dim(hflights)

# b
hflights_df <- as_tibble(hflights)

# c
hflights_df |>
  filter(Month==1 & DayofMonth == 1)

# d
hflights_df |>
  filter(Month ==11 | Month==12)

# e
hflights_df |>
  arrange((Month))

# f
hflights_df |>
  arrange(desc(Month))

# g
hflights_df |>
  dplyr::select(-c(DayOfWeek))

# h
hflights_df |>
  group_by(Origin)

# 그룹화 잘 되었는지 확인
hflights_df |> 
  group_by(Origin) |> 
  summarise(count = n())
# 현재 어떤 변수로 그룹화되어 있는지를 문자열 벡터로 반환
hflights_df |> 
  group_by(Origin) |> 
  group_vars()

# i
hflights_df |>
  filter(Cancelled==1) |>
  dplyr::select(c(delay)) # delay 변수가 없음

hflights_df |>
  dplyr::select(Cancelled, ArrDelay) |>
  filter(Cancelled == 1)

# ??

# j
hflights_df |>
  group_by(Year, Month, DayofMonth) |> # 수준별로 그룹화 
  dplyr::select(c(DayofMonth, ArrDelay, DepDelay)) |> # 열을 선택 
  summarise(mArrDelay=mean(ArrDelay, na.rm=T), mDepDelay=mean(DepDelay, na.rm=T)) |> # 평균 연착시간과 평균출발 지연시간 구하기 
  filter(mArrDelay >= 40 | mDepDelay >= 40)
