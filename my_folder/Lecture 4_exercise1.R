library(tidyverse)
library(knitr)
set.seed(87)
dat <- tibble(x = c(rnorm(100), rnorm(100)+5)-3,
              y = sin(x^2/5)/x + rnorm(200)/10 + exp(1))
kable(head(dat))
dat$d <-abs(dat$x-0) #ignore y values
dat$d
dat2<-arrange(dat,d)
dat2
dat2_final<-dat2[1:5, ]#subset 5 yrs data
dat2_final
y_predict <- mean(dat2_final$y)
dat_loess <-filter(dat2,d<1)
dat_loess
mean(dat_loess$y)

dat_loess <-filter(dat2,d<0.01)
dat_loess
mean(dat_loess$y) #r is so small, no prediction

library(tidyverse)
xgrid <- seq(-5, 4, length.out=1000)
xgrid
kNN_estimates <- map_dbl(xgrid, function(x){
  ## YOUR CODE HERE FOR kNN
  dat$d <-abs(dat$x-x) #ignore y values
  dat2<-arrange(dat,d)
  dat2_final<-dat2[1:5,]#subset 5 yrs data
  dat2_final
  mean(dat2_final$y)

  ## Note: The variable "x" here is a single value along the grid.
  ## Hint1: Extend your code for kNN from the previous exercise.
  ## Hint2: Say you store the prediction in the variable "yhat".
  ##         Then in a new line of code, write: return(yhat)
})
loess_estimates <- map_dbl(xgrid, function(x){
  ## YOUR CODE HERE FOR LOESS
  dat$d <-abs(dat$x-x) #ignore y values
  dat2<-arrange(dat,d)
  dat_loess <-filter(dat2,d<1)
  dat_loess
  mean(dat_loess$y)
  
  ## Note: The variable "x" here is a single value along the grid.
  ## Hint1: Extend your code for loess from the previous exercise.
  ## Hint2: Say you store the prediction in the variable "yhat".
  ##         Then in a new line of code, write: return(yhat)
})

kNN_estimates
loess_estimates 
est <- tibble(x=xgrid, kNN=kNN_estimates, loess=loess_estimates) %>% 
  gather(key="method", value="estimate", kNN, loess)
ggplot() +
  geom_point(data=dat, mapping=aes(x,y),col="orange") +
  geom_line(data=est, 
            mapping=aes(x,estimate, group=method, colour=method)) +
  theme_bw()

