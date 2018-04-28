##Step 1
num_samples <- 50000
X <- rexp(num_samples, 0.2)
xp <- data.frame(X = seq(1, num_samples, 1), Y = sort(X))
plot(xp, xlab = "Number", ylab = "Values", main = "Scatter_Plot")

##Step 2
Y <- split(X, seq(1,500,1))

##Step 3

##1

pdata1 <- rep(0,100)
for ( i in 1:100){
  val = round(Y[[1]][[i]],0);
  if (val <= 100){
    pdata1[val] = pdata1[val] + 1/100;
  }
}

xcols1 <- c(0:99)
str(pdata1)
str(xcols1)

plot(xcols1, pdata1, "l", xlab="Y1", ylab="P.D.F of Y1")

cdata1 <- rep(0, 100)

cdata1[1] <- pdata1[1]

for(i in 2:100){
  cdata1[i] = cdata1[i-1] + pdata1[i]
}

plot(xcols1, cdata1, "o", col="red", xlab="Y1", ylab="CDF")

##2

pdata2 <- rep(0,100)
for ( i in 1:100){
  val = round(Y[[2]][[i]],0);
  if (val <= 100){
    pdata2[val] = pdata2[val] + 1/100;
  }
}

xcols2 <- c(0:99)
str(pdata2)
str(xcols2)

plot(xcols2, pdata2, "l", xlab="Y2", ylab="P.D.F of Y2")

cdata2 <- rep(0, 100)

cdata2[1] <- pdata2[1]

for(i in 2:100){
  cdata2[i] = cdata2[i-1] + pdata2[i]
}

plot(xcols2, cdata2, "o", col="blue", xlab="Y2", ylab="CDF")

##3

pdata3 <- rep(0,100)
for ( i in 1:100){
  val = round(Y[[3]][[i]],0);
  if (val <= 100){
    pdata3[val] = pdata3[val] + 1/100;
  }
}

xcols3 <- c(0:99)
str(pdata3)
str(xcols3)

plot(xcols3, pdata3, "l", xlab="Y3", ylab="P.D.F of Y3")

cdata3 <- rep(0, 100)

cdata3[1] <- pdata3[1]

for(i in 2:100){
  cdata3[i] = cdata3[i-1] + pdata3[i]
}

plot(xcols3, cdata3, "o", col="green", xlab="Y3", ylab="CDF")

##4
pdata4 <- rep(0,100)
for ( i in 1:100){
  val = round(Y[[4]][[i]],0);
  if (val <= 100){
    pdata4[val] = pdata4[val] + 1/100;
  }
}

xcols4 <- c(0:99)
str(pdata4)
str(xcols4)

plot(xcols4, pdata4, "l", xlab="Y4", ylab="P.D.F of Y4")

cdata4 <- rep(0, 100)

cdata4[1] <- pdata4[1]

for(i in 2:100){
  cdata4[i] = cdata4[i-1] + pdata4[i]
}

plot(xcols4, cdata4, "o", col="yellow", xlab="Y4", ylab="CDF")

##5
pdata5 <- rep(0,100)
for ( i in 1:100){
  val = round(Y[[5]][[i]],0);
  if (val <= 100){
    pdata5[val] = pdata5[val] + 1/100;
  }
}

xcols5 <- c(0:99)
str(pdata5)
str(xcols5)

plot(xcols5, pdata5, "l", xlab="Y5", ylab="P.D.F of Y5")

cdata5 <- rep(0, 100)

cdata5[1] <- pdata5[1]

for(i in 2:100){
  cdata5[i] = cdata5[i-1] + pdata5[i]
}

plot(xcols5, cdata5, "o", col="orange", xlab="Y5", ylab="CDF")

avg <- rep(0,500)
sdev <- rep(0,500)

for ( i in 1:500){
  avg[i] <- mean(Y[[i]])
  sdev[i] <- sd(Y[[i]])
}

for ( i in 1:5){
  print(avg[i])
}

for ( i in 1:5){
  print(sdev[i])
}

##Step 4

pdata_m <- rep(0, 10);

for(i in 1:500){
  val=round(avg[i], 0);
  if(val <= 100){
    pdata_m[val] = pdata_m[val] + 1/ 500; 
  }
}

xcols_m <- c(1:10)

str(pdata_m)
str(xcols_m)

plot(xcols_m, pdata_m, "l", xlab="Mean", ylab="f(x)", main = "pdf of means")

cdata_m <- rep(0, 10)

cdata_m[1] <- pdata_m[1]

for(i in 2:10){
  cdata_m[i] = cdata_m[i-1] + pdata_m[i]
}

plot(xcols_m, cdata_m, "o", col="pink", xlab="mean", ylab="F(X)", main="CDF of means")

tab <- table(round(avg))
str(tab)

plot(tab, "h", xlab="Value", ylab="Frequency")

##Step 5

finalmean <- rep(0,1)
finalsd <- rep(0,1)
finalmean  = mean(avg)
finalsd = sd(avg)

print(finalmean)
print(finalsd)
