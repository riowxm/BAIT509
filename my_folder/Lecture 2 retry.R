###################
#lecture 1
#Xiaomeng Wei(Rio)
#39254420
###################

#Oracle regression
library(tidyverse)
genreg <- function(n){
  x1 <- rnorm(n)
  x2 <- rnorm(n)
  eps <- rnorm(n)
  y <- 5-x1+2*x2+eps #ep is the constant in the regression model
  tibble(x1=x1, x2=x2, y=y)
}

#1. generate data
genreg(10)

dat <- genreg(1000)
dat


#2. For now, ignore the Y values. Use the means from the distributions listed above to predict Y under four circumstances:
#Using both the values of X1 and X2.
#Using only the values of X1.
#Using only the values of X2.
#Using neither the values of X1 nor X2. (Your predictions in this case will be the same every time – what is that number?)

dat <-mutate(dat,
       yhat = 0,
       yhat1= 5-x1,
       yhat2=5+2*x2,
       yhat12=5-x1+2*x2)
dat

#3. Now use the actual outcomes of Y to calculate the mean squared error (MSE) for each of the four situations.
#Try re-running the simulation with a new batch of data. Do your MSE’s change much? If so, choose a larger sample so that these numbers are more stable.
(mse <- mean((dat$yhat-dat$y)^2))
(mse1 <- mean((dat$yhat1-dat$y)^2))
(mse2 <- mean((dat$yhat2-dat$y)^2))
(mse3 <- mean((dat$yhat12-dat$y)^2))

table<-cbind(mse,mse1,mse2,mse3)
table

########################
#Oracle classification
#######################
#1
#x=1
pA1 <- 0.2
pA1

pB1 <- 0.8/(1+exp(-1))
pB1 

pC1 <-1-pB1-pA1
pC1

table2 <- cbind(pA1, pB1, pC1)
table2
#if x>0.classicication B because B is the mode
ggplot(tibble(p=c(pA1,pB1,pC1), y=LETTERS[1:3]), aes(y, p)) +
  geom_col() +
  theme_bw() +
  labs(y="Probabilities", title="X=1")

#x=-2
pA2 <- 0.2
pA2

pB2<- 0.8/(1+exp(2))
pB2

pC2 <-1-pB2-pA2
pC2
table3 <- cbind(pA2, pB2, pC2)
table3
#if x<0,classification c
ggplot(tibble(p=c(pA2,pB2,pC2), y=LETTERS[1:3]), aes(y, p)) +
  geom_col() +
  theme_bw() +
  labs("Probabilities", title="X=-2")

#2
#if x>0.classicication B because B is the mode
#if x<0,classification c
gencla <- function(n) {
  x <- rnorm(n) 
  pB <- 0.8/(1+exp(-x))
  y <- map_chr(pB, function(x) 
    sample(LETTERS[1:3], size=1, replace=TRUE,
           prob=c(0.2, x, 1-x)))
  tibble(x=x, y=y)
}

#3
dat2<-gencla(1000)

#4
dat2$yhat <- if_else(dat2$x<0, "C", "B")



#5
1-mean(dat2$yhat == dat2$y)


