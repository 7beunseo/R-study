# 12.2
library(dplyr)
library(MASS)
library(ggplot2)
data(cabbages)
attach(cabbages)
head(cabbages)
Class(cabbages)

# 복잡한 데이터의 구조를 한 눈에 보여줌
str(cabbages)

# 한 번에 한 단계씩
# tibble 객체 만들기 
cabbages_df <- as_tibble(cabbages)

# 스크린에 프린트될 경우 일부분만 보여줌 
cabbages_df

filter(cabbages_df, Cult=="c39") # Cult=="39"만 가져옴 

arrange(cabbages_df, Cult) # Cult 종류별로 정렬 

cabbages2 <- mutate(cabbages_df, citc.rate=VitC/HeadWt) # citc.rate 열 추가 
cabbages_df
head(cabbages2)

# chain 함수로 연결하여 계산
cabbages_df <- as_tibble(cabbages) # tbl object 

cab2 <- cabbages_df %>%
  group_by(Cult) %>%               # Cult 변수로 그룹화 
  filter(Cult=="39") %>%           # Cult=="c39"인 경우만 선택 
  mutate(citc.rate=VitC/HeadWt)    # vitc.rate 변수를 생성해서 추가 
head(cab2)


# 12.2
# Cult 열과 HeadWt 열 선택 3가지 방법 
dplyr::select(cabbages, Cult, HeadWt)            # 변수명 직접 입력, 인자로 df를 넣어주어야 함, tibble 객체 x 
cabbages %>% dplyr::select(c('Cult', "HeadWt"))  # 문자 벡터 입력(그냥 변수도 되던데..?), 다른 파이프와 연결 가능
cabbages[, c("Cult", "HeadWt")] # 문자열이어야 함 주의! 


# 12.3
# cabbages 데이터에 대해 몇 개 열을 제외하고 선택 
dplyr::select(cabbages, -Cult, -HeadWt) 
# dplyr::select(cabbages, -c(Cult, HeadWt)) -> 벡터로 감싸도 됨 
cabbages %>% dplyr::select(c(-Cult, -HeadWt)) # - 붙여야 함 


# 12.4
# 데이터에 대해 조건이 맞는 경우를 추출 
cabbages %>% filter(Cult=='c52')
cabbages[(cabbages$Cult=='c52'), ]
cabbages %>% filter(Date %in% c('d16', 'd20'))    # %in% 연산자 사용 
cabbages %>% filter(HeadWt >= 2.5, Cult=='c52')   # , = and 
cabbages %>% filter(HeadWt >= 2.5 & Cult=='c52')
cabbages %>% filter(HeadWt >= 2.5 & VitC < 45)    # and
cabbages %>% filter(HeadWt >= 5 | VitC < 45)      # or 


# 12.5
cabbages %>% group_by(Cult) %>% summarize(hm=mean(HeadWt))
# cabbages 데이터셋에서 Cult 변수로 그룹화
# 그룹별로 HeadWt 평균을 구해 summarize() 함수로 통계량 출력 

cabbages %>% group_by(Cult) %>% summarize(hm=mean(HeadWt), cm=mean(VitC))
# cabbages 데이터셋에서 Cult 변수로 그룹화
# 그룹별로 HeadWt 평균과 VitC 평균을 구함 

cabbages %>% group_by(Cult) %>% summarize(dcount=n())
# cabbages 데이터셋에서 Cult 변수로 그룹화
# 그룹별로 도수를 구함 


# 12.6
# mutate -> 변수를 추가하는 함수 
ca <- cabbages %>% dplyr::select(Cult, HeadWt) %>%
  mutate(better=ifelse(HeadWt>4, 'A', 'B'))
head(ca)
# cabbages 데이터에 대해 mutate 함수 적용하여 변수 추가 
# ifelse() 조건문 -> 참이면 'A' 거짓이면 'B' 부여 


# 12.7
cabbages |>
  arrange(desc(HeadWt)) # 내림차순 

cabbages %>% # 기호 똑같음 
  arrange(desc(HeadWt))

cabbages |>
  arrange(HeadWt, VitC)

cabbages |>
  filter(Cult=='c52' & HeadWt > 3) |>
  arrange(HeadWt, VitC)


### 연습문제 모음
# Cult가 39인 것만 뽑아서, vitc.rate 변수를 추가하고 VitC/HeadWt 값 넣기 
cabbages_df |>
  filter(Cult=="c39") |>
  mutate(vitc.rate=VitC/HeadWt)

# cabbages 데이터에 대해 Cult, HeadWt 행만 출력하기
# 파이프 x
dplyr::select(cabbages, Cult, HeadWt)

# 파이프 o
cabbages_df |> dplyr::select(Cult, HeadWt)

# 벡터에서 직접 필터링 
cabbages[,c("Cult", "HeadWt")] # 꼭 문자열이어야 함 

# 데이터에 몇 개 열을 제외하고 선택 - Cult 열과 HeadWt 열 제거 
# 파이프 x
dplyr::select(cabbages, -Cult, -HeadWt)

# 파이프 o
cabbages_df |> dplyr::select(-Cult, -HeadWt)

# Cult 값이 c52인 경우만 추출
cabbages_df |>
  filter(Cult=="c52")

# cabbages 데이터셋에서 Cult 값이 c52인 경우만 추출 (벡터에서 바로)
cabbages[Cult=="c52",]

# Date 값이 'd16' 또는 'd20'인 경우만 추출 
cabbages_df |> filter(Date=="d16" | Date == "d20")
cabbages_df |> filter(Date %in% c("d16", "d20")) # in 연산자 사용 -> %in% 

# HeadWt >= 3, Cult 값이 'c52'인 경우만 선택 
cabbages_df |> filter(HeadWt >= 3, Cult=="c52")

# HeadWt>=3 그리고 VitC < 45인 경우만 선택 
cabbages_df |> filter(HeadWt >= 3 & VitC < 45)

# HeadWt>=5 또는 VitC > 70인 경우만 선택 
cabbages_df |> filter(HeadWt >= 5 | VitC > 70)

# Cult 변수로 그룹화하고, 그룹 별로 HeadWt 평균을 구한다. (변수명 hm)
cabbages_df |>
  group_by(Cult) |>
  summarise(hm=mean(HeadWt)) # group_by를 한 후에 mutate말고 summarize 써야 함!!

# Cult 변수로 그룹화하고, 그룹 별로 HeadWt 평균과 VitC 평균을 구함 (hm, cm) 
cabbages_df |>
  group_by(Cult) |>
  summarise(hm=mean(HeadWt), cm=mean(VitC))

# Cult 변수로 그룹화하고 그룹별로 도수를 구함 
cabbages_df |>
  group_by(Cult) |>
  summarise(n=n())

# Cult, HeadWt 행만 선택하고, better 행에 HeadWt가 4보다 크면 'A', HeadWt가 4 이하면 'B'
cabbages_df |>
  dplyr::select(Cult, HeadWt) |>
  mutate(better=ifelse(HeadWt>4, 'A', 'B')) # ifelse(조건문, 참, 거짓) 

# HeadWt를 내림차순으로 정리 
cabbages_df |> arrange(desc(HeadWt))

# HeadWt 오름차순으로 정리하고, HeadWt 값이 동일한 경우는 VitC 오름차순으로 정리 
cabbages_df |> arrange(HeadWt, VitC)

# Cult 값이 'c52'이고 HeadWt>3인 경우(행)만 선택하여 HeadWt 오름차수능로 정렬하고, HeadWt 값이 동일한 경우는 VitC 오름차순으로 정리
cabbages_df |>
  filter(Cult=='c52' & HeadWt > 3) |>
  arrange(HeadWt, VitC)

## 연습문제 어려워서 추가..
library(dplyr)
library(hflights)
data(hflights)
hflights[1,]

# (j) chain 함수 %>%를 이용하여 다음을 구하시오.
# hflights_df 데이터프레임
# (j1) Year, Month, DayofMonth의 수준별로 그룹화,
# (j2) Year부터 DayofMonth, ArrDelay, DepDelay 열을 선택,
# (j3) 평균 연착시간(ArrDelay)과 평균 출발지연시간(DepDelay)을 구하고,
# (j4) 평균 연착시간 또는 평균 출발지연시간이 40분 이상인 데이터를 추출하시오.

hflights_df |> 
  group_by(Year, Month, DayofMonth) |>
  dplyr::select(Year, DayofMonth, ArrDelay, DepDelay) |>
  summarise(arr=mean(ArrDelay, na.rm=T), dep=mean(DepDelay, na.rm=T)) |> # na.rm=T를 해야 결과 출력이 됨!! 그리고 group_by를 했으니까 summarise를 써야 함 (mutate x) 
  filter(arr>=40 | dep>=40)

# mean을 사용할 때는 혹시나 na.rm=T 옵션을 넣어주도록 하자! 
