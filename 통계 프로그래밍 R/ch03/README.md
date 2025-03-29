### 두 개 이상의 그래프를 한 화면에 그리고 동시에 비교하고자 할 때 `par()`
```r
par(mfrow=c(2,1))
```

### 하나의 좌표평면에 여러 개의 그래프 그리기
* matplot() # type="pll" 처럼 한 번에 옵션 주기 
* lines() # 선으로 그림 
* points() # 점으로 그림 


### y축 텍스트 90도 회전
las=1

### 수직선 그리기
* abline()
* v=
* h=
* (a,b)
  * y = bx + a
 
### plot 그래프에 점 찍기 
* plot 찍은 후, text(x=X, y=Y, labels={출력하고 싶은 내용}, adj={0, 1, 2}) 산점도 점 하나하나에 라벨을 달 수 있음

### 윈도우 창
그래프 열기
* `win.graph()`
* `windows()`

그래프 닫기
* `graphics.off()`
