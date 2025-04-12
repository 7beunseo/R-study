```r
group = rep(1:5,each=4)

y = c(2.4, 2.7, 3.1, 3.1, 0.7, 1.6, 1.7, 1.8, 2.4, 3.1, 
      5.4, 6.1, 0.3, 0.3, 2.4, 2.7, 0.5, 0.9, 1.4, 2.0)

sol = cbind(group, y)
group = as.factor(group) # 숫자 자체의 의미 x 
aov1 = aov(y~group) # y라는 데이터가 grouyp에 따라 차이가 있냐? 
summary(aov1) # 분산분석
```

#### 가설 설정
![image](https://github.com/user-attachments/assets/484c85c2-a0c6-4e9c-ba71-41dcfcf9a9ba)

#### 1 way ANOVA table
![image](https://github.com/user-attachments/assets/1676d55c-cfd5-4dbb-9174-661a378eebd2)
* 유의수준 0.05에서 p-value < 0.05이므로 귀무가설 기각  => `적어도 한 그룹의 효과는 다른 것이다`

#### f-value로 p-value 구하기
```r
1 - pf(5.966, 4, 15)
```
#### 유의수준 0.05에서 기각역 구하기
```r
qf(0.95, 4, 15)
```

#### factor 별로 상자 그림 출력
```r
plot(y~group)
```
![image](https://github.com/user-attachments/assets/4f700cd3-0143-4beb-be4a-19883252113b)
* group5는 다른 그룹보다 `중앙값`이 높음 (`평균`이 아님)
* 1, 3, 5의 그룹 분포가 달라보임
* 표본 크기가 작거나, 오차 가정을 지키지 못한다면 귀무가설을 기각하지 못할 수 있음
* `다중비교`로 어떻게 다른지 확인해야 함 

#### 회귀분석 형태로 확인
![image](https://github.com/user-attachments/assets/1263d035-26ea-4c58-ace9-73be4c06aa4c)
* group 1을 기준으로 비교
* group5는 유의수준 0.05에서 유의하다. -> 음수이므로 group1보다 평균이 유의하게 낮음
* 다른 그룹들도 0.01에서는 유의성을 보일 수 있으나 엄밀하게 통계적으로 결정짓기는 어려움


# 모형에 대한 가정
```r
plot(aov1)
```
![image](https://github.com/user-attachments/assets/f38d74fe-63c5-4c2d-b23d-0170099bfa4d)
* 독립
* 정규분포
 * 등분산성
#### 잔차 그림
![image](https://github.com/user-attachments/assets/b9898457-c2e0-4165-9562-7e015abceb80)
* 잔차 그림의 경우, 모형의 오차에 대한 가정 중 `독립성`, `등분산성`을 만족하는 경우에 각각의 점으로 표현되는 잔차들이 y축 기준으로 0을 기준으로 위, 아래로 대체로 대칭적이며 특별한 패턴이 없이 나옴
* 하지만 실제 데이터가 이러한 오차에 대한 가정을 만족하지 못한다면 `어떠한 패턴`을 나타냄 
* 따라서 이 잔차 그림을 통해 `잔차들이 0을 기준으로 랜덤하게 나타나는지` 확인하함으로써 오차에 대한 가정을 확인할 수 있음 
* 그리고 이 때 빨간색 선은 잔차들의 평균을 직선으로 표현한 것. 따라서 이 `직선이 y=0의 가로선과 비슷`하다면, 잔차의 평균이 0과 비슷하고 볼 수 있으며, 특정한 패턴이 없다고 판단할 수 있음
![image](https://github.com/user-attachments/assets/b0aaeb29-18db-43db-b326-5fdd8ef618f2)
* `독립성`에 어긋나는 경우

#### Q-Q 그림
![image](https://github.com/user-attachments/assets/190c715b-f0ae-458b-b807-bf5fa508bbd8)
* 대각선 위에 모든 점이 위치해있다면, 정확한 `정규분포`를 따름
* 많은 점들이 아니라 몇몇의 점들이 대각선에서 조금씩 떨어져 있더라고 정규분포를 따른다는 가정에서 크게 어긋나지 않음

#### 표준화 잔차 그림
![image](https://github.com/user-attachments/assets/cbdfa762-ea12-4503-83ea-792199571198)
* `잔차들이 0-2 사이`에 놓여있다면 데이터에 특별히 이상한 값 없이 `정규분포`를 따르는 데이터

#### 그룹별 잔차
![image](https://github.com/user-attachments/assets/3a2a11ca-e242-41bf-93a4-d7ae29c4fb58)
* 처리요인의 `각 수준 마다` 해당되는 잔차를 표현한 그림
* 각 처리 수준마다 `비슷한 퍼짐`을 나타낸다면, 오차의 분산이 처리 수준에 영향을 받지 않고 따라서 모든 수준에서 동일한 분포를 가짐
* 이 경우는 처리 수준에 대해서도 `등분산성`을 만족
![image](https://github.com/user-attachments/assets/16b5ec5f-be47-46f2-a631-635bc8b1d266)
* 점차 퍼져나가는 어떠한 패턴이 존재하는 경우는 `등분산성`에 어긋나는 형태

# 등분산성 확인
#### 바틀렛 검정
가설
![image](https://github.com/user-attachments/assets/c10d8b1d-7ce6-4ffe-9977-fe800925150f)
* 여기서 1, 2, 3, 4, 5 5개 처리 수준으로 변경한..
```r
bartlett.test(y~group)
```
![image](https://github.com/user-attachments/assets/98347a60-afa5-4704-9ece-bb3ee699b433)
* 유의수준 0.05에서 p-value < 0.05이므로 귀무가설을 기각. 등분산성을 만족함
#### 레빈 검정 
```r
install.packages("lawstat")
library(lawstat)
# levene.test(y, group, option=c("mean", "median", "trim.mean"), trim.alpha=1)
levene.test(y, group, location = "mean")      # 평균 기반
levene.test(y, group, location = "median")    # 중앙값 기반
levene.test(y, group, location = "trimmed", trim.alpha = 0.1)  # 절사평균 기반
```

# 다중 비교
분산분석에서 처리들의 효과가 모두 같다는 귀무가설이 기각됨. 구체적으로 어떤 처리가 다른 효과를 나타내는지 검정하기 위해 다중 비교 진행.

#### `tapply`로 각 그룹 평균 구하기
```r
tapply(y, group, mean)
```
* group 5가 가장 평균이 낮고, group 3이 가장 평균이 높군!

#### LSD
0.05를 기준으로 p-value를 사용함 
```r
pairwise.t.test(y, group, p.adjust="none", pool.sd=T)
# none : LSD
# pool.sd=T 등분산을 가정함 
```
![image](https://github.com/user-attachments/assets/e9b57348-524c-4823-9d20-e59d283ab176)
* 평균을 오름차순으로 정렬
* 평균차가 유의하지 않으면 밑줄을 그림 (`p-value > 0.05인 값들`)
* 묶을 수 있는 그룹은 (5, 4, 2) (1, 3)
* 혹은 (5), (4, 2, 1), (3)도 가능

#### Bonferroni (pool.sd=T)
```r
pairwise.t.test(y, group, p.adjust="bonferroni", pool.sd=T)
```
![image](https://github.com/user-attachments/assets/434d1a08-c3be-49ba-a698-454b3c3c4d6f)
* 한 개의 그룹밖에 안 나옴
* LSD 방식에 비해 매우 보수적으로 처리평균 간 차이가 유의하다는 결론을 쉽게 내리지 않음
* LSD의 p-value에 비교 횟수만큼 p-value에 곱함 (기각값/검정개수) 5C2

#### Bonferroni (pool.sd=F)
```r
pairwise.t.test(y, group, p.adjust="bonferroni", pool.sd=F)
```

#### Tukey HSD
```r
a.tukey <- TukeyHSD(aov1)
a.tukey
plot(a.tukey) # 신뢰구간 출력 
```
![image](https://github.com/user-attachments/assets/65e6103e-3fa6-46d7-9b24-e23fe2d5787a)
* group 3이 다름
![image](https://github.com/user-attachments/assets/2aae8c1a-8157-489c-baef-8fdaaf86743f)
* 95% 신뢰구간이 0을 포함하면 귀무가설을 기각하지 못함!

## agricolae 패키지를 이용한 다중 비교
#### LSD
```r
(LSD.test(aov1, "group", p.adj="none"))
```
![image](https://github.com/user-attachments/assets/d2be3c85-88e1-478f-a15d-7ff4a640ce65)
* (1, 3) (2, 4, 5)로 그룹화됨
#### HSD
```r
(HSD.test(aov1, "group", group=T))
```
![image](https://github.com/user-attachments/assets/a3d605be-e0f0-4a13-8176-59132e190c6d)
#### Scheffe 
p-value 보정 동시 비교 
```r
(scheffe.test(aov1, "group", group=T))
```
![image](https://github.com/user-attachments/assets/8f8b40f8-d207-4e77-b465-5e4522f54e00)

# 대비
#### base에 대한 대비 만들기
```r
contr.treatment(5, base=1, contrasts = T)
# 첫 번째 인자 -> 처리 수
# 두 번째 인자 -> 기준점
# 행렬 형태로 출력됨

contrasts(group) <- contr.treatment(5, base=2, contrasts = T)
summary.lm(aov(y~group))
```
![image](https://github.com/user-attachments/assets/d763ba1a-d644-46fc-b352-8e869790c28e)
* group 3에 대해서 유의함

#### 직교다항대비
```r
contrasts(group) <- contr.poly(levels(group))
summary.lm(aov(y~group))
```
![image](https://github.com/user-attachments/assets/cab4dd0f-ee47-4aeb-9fcb-f95c0b13021c)
* 첫 번째 대비 기각 못 함
* 마지막 대비 유의수준보다 작음 -> 귀무가설 기각.

#### constrastmatrix에 직접 값을 저장하여 직교대비를 직접 생성 
* k = 5이므로, 총 4개의 직교대비를 만들어야 함, 각 직교대비에는 5개의 값을 가지도록
```r
contrastmatrix = cbind( c(-2, -1, 0, 1, 2),
                        c(2, -1, -2, -1, -2),
                        c(-1, 2, 0, -2, 1),
                        c(1, -4, 6, -4, 1)
)

contrasts(group) = contrastmatrix
contrasts(group)
summary.lm(aov(y~group))
```
![image](https://github.com/user-attachments/assets/18988b0f-ddb1-4215-84a9-d8394430bd0f)

#### 하나의 대비 구하기 
구체적인 가설에 대한 F 검정 
![image](https://github.com/user-attachments/assets/93c1e13e-f8d0-4c6c-8a55-7cfe43eebd6f)
```r
N = length(y)
k = 5
m = tapply(y, group, mean)
ni = tapply(y, group, length)
c1 = c(2,2,2,-3,-3)
summ.aov = summary(aov1)
mse = summ.aov[[1]]$`Mean Sq`[2]
f = sum(c1*m)^2 / (mse*sum(c1^2/ni))
1 - pf(f, 1, N-k) # 자유도가 1임!! 
```
* 위 대비의 SSt 구하기
```r
sst = sum(c1*m)^2 / (sum(c1^2/ni))
```
* 위 직교대비에서 가장 SSt 값이 많은 것은?
```r
N = length(y)
k = 5
m = tapply(y, group, mean)
ni = tapply(y, group, length)
sst_list <- rep(0, k-1)
for(i in 1:(k-1)) {
  c <- contrasts(group)[,i] # contr.poly로 직교행렬 넣어줌, 위는 직교 행렬이 아니라 SSt 값이 일치하지 않음 
  sst_list[i] <-  sum(c*m)^2 / (sum(c^2/ni))
}

sum(sst_list)
sst_list
```
### 완전 Tip
직교 대비는 행렬 관점에서 보면 직교 행렬임 (TT(t) = 단위행렬)
```plaintext
t(행렬) %*% 행렬
```
따라서 직교 대비인지 확인하기 위해서 저렇게 %*%를 해주자!
```
              .L            .Q            .C            ^4
.L  1.000000e+00  0.000000e+00 -2.775558e-17  5.551115e-17
.Q  0.000000e+00  1.000000e+00 -2.775558e-17 -1.110223e-16
.C -2.775558e-17 -2.775558e-17  1.000000e+00  0.000000e+00
^4  5.551115e-17 -1.110223e-16  0.000000e+00  1.000000e+00
```
