library(tidyverse)
library(ISLR)
library(knitr)
#training error
set.seed(87)
n <- 200
dat <- tibble(x = c(rnorm(n/2), rnorm(n/2)+5)-3,
              y = sin(x^2/5)/x + rnorm(n)/10 + exp(1))
dat
fit <- loess(y ~ x, data=dat, span=0.3)
yhat <- predict(fit)
yhat
mean((yhat - dat$y)^2) # 0.009599779

#test error
n <- 1000
newdat <- tibble(x = c(rnorm(n/2), rnorm(n/2)+5)-3,
                 y = sin(x^2/5)/x + rnorm(n)/10 + exp(1))
yhat <- predict(fit, newdata = newdat)
mean((yhat - newdat$y)^2, na.rm = TRUE)#0.0112968


set.seed(87)
n <- 200
dat <- tibble(x = c(rnorm(n/2), rnorm(n/2)+5)-3,
              y = sin(x^2/5)/x + rnorm(n)/10 + exp(1))
n <- 1000
newdat <- tibble(x = c(rnorm(n/2), rnorm(n/2)+5)-3,
                 y = sin(x^2/5)/x + rnorm(n)/10 + exp(1))
tibble(r = seq(0.05, 0.7, length.out=100)) %>% 
  group_by(r) %>% 
  do({
    this_r <- .$r
    fit <- loess(y ~ x, data=dat, span=this_r)
    yhat_tr  <- predict(fit)
    yhat_val <- predict(fit, newdata = newdat)
    data.frame(
      r = this_r,
      training = mean((yhat_tr - dat$y)^2),
      validation = mean((yhat_val - newdat$y)^2, na.rm = TRUE)
    )
  }) %>% 
  gather(key="set", value="mse", training, validation) %>% 
  ggplot(aes(r, mse)) +
  geom_line(aes(group=set, colour=set)) +
  theme_bw()
