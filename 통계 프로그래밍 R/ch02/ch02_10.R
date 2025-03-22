### 반복문

# for 
for(i in 1:4) {
  print(i)
}

sum <- 0
for(i in 100:200) {
  sum <- sum + i
}
sum

x <- c(5, 6, 7, 8)
n <- length(x)
xx <- rep(0, n)
for(i in 1:n) {
  xx[i] <- x[i]^2
}
xx

transport <- c("bus", "subway", "car", "bike")
for(t in transport) {
  print(t)
}

# while 
n <- 0
sum.sofar <- 0
while(sum.sofar <= 100) {
  n <- n + 1
  sum.sofar <- sum.sofar + n
}
n
sum.sofar

# repeat
n <- 0
sum.sofar <- 0
repeat {
  n <- n + 1
  sum.sofar <- sum.sofar + n
  if(sum.sofar > 100) break
}
n
sum.sofar
