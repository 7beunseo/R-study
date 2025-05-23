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
dplyr::select(cabbages, Cult, HeadWt)            # 변수명 직접 입력 
cabbages %>% dplyr::select(c('Cult', "HeadWt"))  # 문자 벡터 입력(그냥 변수도 되던데..?), 다른 파이프와 연결 가능 
cabbages[, c("Cult", "HeadWt")]


# 12.3
# cabbages 데이터에 대해 몇 개 열을 제외하고 선택 
dplyr::select(cabbages, -Cult, -HeadWt)
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
