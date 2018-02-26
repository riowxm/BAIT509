
R version 3.4.1 (2017-06-30) -- "Single Candle"
Copyright (C) 2017 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin15.6.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[R.app GUI 1.70 (7375) x86_64-apple-darwin15.6.0]

[Workspace restored from /Users/xiaomengwei/.RData]
[History restored from /Users/xiaomengwei/.Rapp.history]

> library("tidyverse")
── Attaching packages ────────────────────────────────────── tidyverse 1.2.1 ──
✔ ggplot2 2.2.1     ✔ purrr   0.2.4
✔ tibble  1.4.2     ✔ dplyr   0.7.4
✔ tidyr   0.8.0     ✔ stringr 1.2.0
✔ readr   1.1.1     ✔ forcats 0.2.0
── Conflicts ───────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
Warning messages:
1: package ‘tidyverse’ was built under R version 3.4.2 
2: package ‘tibble’ was built under R version 3.4.3 
3: package ‘tidyr’ was built under R version 3.4.3 
4: package ‘purrr’ was built under R version 3.4.2 
5: package ‘dplyr’ was built under R version 3.4.2 
l
> library("ISLR")
Warning message:
package ‘ISLR’ was built under R version 3.4.2 
> library("knitr")
Warning message:
package ‘knitr’ was built under R version 3.4.3 
> genreg <- function(n){
+     x1 <- rnorm(n)
+     x2 <- rnorm(n)
+     eps <- rnorm(n)
+     y <- 5-x1+2*x2+eps
+     tibble(x1=x1, x2=x2, y=y)
+ }
> genreg(30)
# A tibble: 30 x 3
       x1       x2      y
    <dbl>    <dbl>  <dbl>
 1  0.617 -1.99     0.826
 2  0.243 -1.53     1.53 
 3  0.650  1.31     6.37 
 4  1.26  -1.15     0.679
 5 -2.10   0.00793  7.06 
 6 -0.223 -0.475    4.41 
 7 -2.41  -0.468    7.20 
 8  1.23  -1.02     1.89 
 9  1.71  -0.276    4.76 
10 -1.63   2.57    13.1  
# ... with 20 more rows
> genreg2 <- function(n){
+     x1 <- rnorm(n)
+     x2 <- 0
+     eps <- rnorm(n)
+     y <- 5-x1+2*x2+eps
+     tibble(x1=x1, x2=x2, y=y)
+ }
> genreg2(30)
# A tibble: 30 x 3
         x1    x2     y
      <dbl> <dbl> <dbl>
 1 -1.35       0.  5.92
 2  1.54       0.  4.79
 3  0.0623     0.  4.34
 4 -1.13       0.  6.54
 5  1.24       0.  4.28
 6  0.134      0.  5.51
 7  0.00841    0.  5.01
 8 -0.0267     0.  4.20
 9 -1.08       0.  5.40
10 -0.269      0.  3.47
# ... with 20 more rows
> genreg3 <- function(n){
+     x1 <- 0
+     x2 <- rnorm(n)
+     eps <- rnorm(n)
+     y <- 5-x1+2*x2+eps
+     tibble(x1=x1, x2=x2, y=y)
+ }
> genreg3(30)
# A tibble: 30 x 3
      x1      x2     y
   <dbl>   <dbl> <dbl>
 1    0.  0.314  4.45 
 2    0.  0.204  6.71 
 3    0. -0.758  2.90 
 4    0.  1.17   6.96 
 5    0. -1.09   2.98 
 6    0.  0.0778 7.33 
 7    0.  0.469  4.98 
 8    0.  1.81   9.74 
 9    0. -0.980  1.53 
10    0. -1.26   0.975
# ... with 20 more rows
> genreg4 <- function(n){
+     x1 <- 0
+     x2 <- 0
+     eps <- rnorm(n)
+     y <- 5-x1+2*x2+eps
+     tibble(x1=x1, x2=x2, y=y)
+ }
> genreg4(30)
# A tibble: 30 x 3
      x1    x2     y
   <dbl> <dbl> <dbl>
 1    0.    0.  4.21
 2    0.    0.  4.84
 3    0.    0.  4.31
 4    0.    0.  4.94
 5    0.    0.  4.50
 6    0.    0.  5.93
 7    0.    0.  4.74
 8    0.    0.  7.39
 9    0.    0.  4.52
10    0.    0.  4.48
# ... with 20 more rows
objc[1919]: Class FIFinderSyncExtensionHost is implemented in both /System/Library/PrivateFrameworks/FinderKit.framework/Versions/A/FinderKit (0x7fff9dcbfb68) and /System/Library/PrivateFrameworks/FileProvider.framework/OverrideBundles/FinderSyncCollaborationFileProviderOverride.bundle/Contents/MacOS/FinderSyncCollaborationFileProviderOverride (0x115f28cd8). One of the two will be used. Which one is undefined.
> 