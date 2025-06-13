#####
# 1 #
#####

BP = c(123, 135, 120, 136, 122, 129, 117, 139, 125, 136, 122, 142,
       114, 123, 109, 132, 115, 132, 140, 150, 141, 147, 138, 154)
Diet <- as.factor(rep(1:4, each=6))
Time <- as.factor(rep(1:2, 12))
Subject <- as.factor(rep(1:12, each=2))
# Diet > Subject 

aovdata <- data.frame(BP, Diet, Time, Subject)

a.aov <- aov(BP ~ Diet + Error(Diet/Subject) + Time * Diet, data=aovdata)
# Error가 두 종류 존재함 
# 둘을 구분하라는 의미 
# Error(Diet/Subject) -> Subject가 Diet에 종속된 random 효과라는 것을 알려줌 
# 실험자 간의 변동을 검증하기 위해 오차항으로 둠 
# Error(Diet/Time) -> Time이 Diet에 종속된 random 효과라고 알림 
# 그러나 반복이 '실험자' 단위로 이루어졌다는 정보는 무시하고 '시간'이 오차의 원인이라고 알려주게 됨 

summary(a.aov)

# 분할구요인 Time -> 귀무가설 기각 -> Time에 따른 반응값의 차이가 있다.

# 직접 f 통계량, 기각역 만들기 
624.5 / 7.333 # f 통계량 
qf(0.95, 3, 8) # 기각역 

tapply(BP, Diet, mean) # 식이요법에 따른 반응값의 평균 
tapply(BP, Time, mean) # 식이요법에 따른 반응값의 평균 
tapply(BP, list(Diet, Time), mean) # 두 factor 각 조합마다 나옴 
tapply(BP, Diet:Time, mean)

#####
# 2 #
#####


Chamber = as.factor(rep( rep(1:2, each=2), 24))
Ozone = as.factor(rep( rep(1:4, each=4), 6))
Variety = as.factor(rep(1:6, each=16))
Location = as.factor(rep(c('R','T'), 48))
Y = c(0.26, 0.37, 0.13, 0.27, 0.23, 0.29, 0.01, 0.33, 0.11, 0.05, 0.4, 0.41, 0.38, 0.11, 0.54, 0.18,
      0.09, 0.24, 0.49, 0.09, 0.32, 0.33, 0.12, 0.41, 0.35, 0.28, 0.48, 0.53, 0.56, 0.38, 0.33, 0.3,
      0.26, 0.24, 0.13, 0.19, 0.36, 0.02, 0.2, 0.26, 0.13, 0.45, 0.11, 0.28, 0.61, 0.18, 0.7, 0.14,
      0.51, 0.12, 0.45, 0.21, 0.31, 0.18, 0.04, 0.45, 0.34, 0.58, 0.25, 0.17, 0.22, 0.33, 0.56, 0.4,
      0.04, 0.8, 0.55, 0, 0.32, 0.49, 0.12, 0.41, 0.34, 0.09, 0.28, 0.38, 0.2, 0.81, 0.36, 0.19,
      0.02, 0.55, 0.11, 0.75, 0.03, 0.3, 0.37, 0.2, 0.35, 0.6, 0.19, 0.47, 0.3, 0.36, 0.66, 0.63)
ozonedata = data.frame(Ozone, Chamber, Location, Variety, Y)
ozonedata

mod <- aov(Y~Ozone*Variety*Location+Error(Ozone/Chamber/Variety/Location))
summary(mod)

tapply(Y, list(Chamber, Ozone), mean)
tapply(Y, list(Ozone, Variety), mean)
