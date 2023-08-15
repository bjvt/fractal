# https://magesblog.com/post/2012-03-17-logistic-map-feigenbaum-diagram/
setwd("/home/bvt/Dropbox/eng_science/R/wd/fractal")

library(compiler) ## requires R >= 2.13.0
logistic.map <- cmpfun(logistic.map) # same function as above
my.r <- seq(2.5, 4, by=0.001)
N <- 2000; M <- 500; start.x <- 0.1
orbit <- sapply(my.r, logistic.map,  x=start.x, N=N, M=M)
Orbit <- as.vector(orbit)
r <- sort(rep(my.r, (M+1)))
plot(Orbit ~ r, pch=".", col=rgb(0,0,0,0.05))
