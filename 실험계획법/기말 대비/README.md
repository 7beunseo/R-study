```r
# 별명 생성용 
library(FrF2)
```
```r
# 계수표 벡터 미리 만들어두기
contrast_A   <- c(-1, -1, -1, -1, +1, +1, +1, +1)
contrast_B   <- c(-1, -1, +1, +1, -1, -1, +1, +1)
contrast_C   <- c(-1, +1, -1, +1, -1, +1, -1, +1)

contrast_AB  <- contrast_A * contrast_B
contrast_AC  <- contrast_A * contrast_C
contrast_BC  <- contrast_B * contrast_C

contrast_ABC <- contrast_A * contrast_B * contrast_C
```

```r
# 주구 효과 p-value 구하기
f <- 624.5/7.333 # MSwp/MSwpe
f
1 - pf(f, 3, 8)
```
