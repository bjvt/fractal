# https://host6.ssl-net.net/martinstoppacher_com/blog/?p=1326
# https://www.r-bloggers.com/the-mandelbrot-set-in-r/
# https://magesblog.com/post/2012-03-17-logistic-map-feigenbaum-diagram/


setwd("/home/bvt/Dropbox/eng_science/R/wd/fractal")

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# ploting more values but only the last

plot(0,0, ylab="", xlab="", cex=0, xlim=c(2.5,4), ylim=c(0,1))
r <- 88
n<-300
m<-30
for(e in ((290:400)/100)){
  print(r)
  r <- e
  x <- 0.1
  for(i in 2:n){
    (x[i] <- r*x[i-1]*(1-x[i-1]))
    print(r)
    print(x[i])
  }
  x
  points(rep(r,(m+1)),x[(n-m):n], type="p", cex=0.2, lwd=0.2)
}

