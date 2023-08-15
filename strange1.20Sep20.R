# https://www.williamrchase.com/post/strange-attractors-12-months-of-art-february/
# https://fronkonstin.com/2017/11/07/drawing-10-million-points-with-ggplot-clifford-attractors/

setwd("/home/bvt/Dropbox/eng_science/R/wd/fractal")

library(Rcpp)
library(ggplot2)
library(dplyr)

opt = theme(legend.position  = "none",
            panel.background = element_rect(fill="white"),
            axis.ticks       = element_blank(),
            panel.grid       = element_blank(),
            axis.title       = element_blank(),
            axis.text        = element_blank())

cppFunction('DataFrame createTrajectory(int n, double x0, double y0, 
            double a, double b, double c, double d) {
            // create the columns
            NumericVector x(n);
            NumericVector y(n);
            x[0]=x0;
            y[0]=y0;
            for(int i = 1; i < n; ++i) {
            x[i] = sin(a*y[i-1])+c*cos(a*x[i-1]);
            y[i] = sin(b*x[i-1])+d*cos(b*y[i-1]);
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

a=-1.24458046630025
b=-1.25191834103316 
c=-1.81590817030519 
d=-1.90866735205054

df=createTrajectory(10000000, 0, 0, a, b, c, d)

png("Clifford.png", units="px", width=1600, height=1600, res=300)
ggplot(df, aes(x, y)) + geom_point(color="green", shape=46, alpha=.01) + opt
dev.off()

############
# https://gist.github.com/DavisVaughan/549334145e3f38bf31c205295f59e788

a=-1.24458046630025
b=-1.25191834103316 
c=-1.81590817030519 
d=-1.90866735205054

n <- 10000000
x <- vector("numeric", n)
y <- vector("numeric", n)
x[1] <- 0
y[1] <- 0

t1 <- proc.time()
for(i in 2:n) {
  x[i] <- sin(a * y[i-1] + c * cos(a * x[i-1]))
  y[i] <- sin(b * x[i-1] + d * cos(b * y[i-1]))
}
df <- data.frame(x = x, y = y)
proc.time() - t1

