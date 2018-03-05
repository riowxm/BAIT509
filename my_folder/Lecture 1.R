library(tidyverse)
genreg <- function(n){
  x1 <- rnorm(n)
  x2 <- rnorm(n)
  eps <- rnorm(n)
  y <- 5-x1+2*x2+eps
  tibble(x1=x1, x2=x2, y=y)
}

dat <- genreg(1000)
dat <- mutate(dat,
              yhat = 5,
              yhat1 = 5-x1,
              yhat2 = 5+2*x2,
              yhat12 = 5-x1+2*x2)

(mse <- mean((dat$yhat - dat$y)^2))
(mse1 <- mean((dat$yhat1 - dat$y)^2))
(mse2 <- mean((dat$yhat2 - dat$y)^2))
(mse12 <- mean((dat$yhat12 - dat$y)^2))
knitr::kable(tribble(
  ~ Case, ~ MSE,
  "No predictors", mse,
  "Only X1", mse1,
  "Only X2", mse2,
  "Both X1 and X2", mse12
))
