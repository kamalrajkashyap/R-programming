install.packages("aqp")
install.packages("soilDB")
install.packages("ggplot2")
library(ggplot2)
library(aqp)
library(soilDB)
data("loafercreek")
View(loafercreek)

n <- c("A", "BAt", "Bt1", "Bt2", "Cr", "R")

p <- c("A", "BA|AB", "Bt|Bw", "Bt3|Bt4|2B|C",
        "Cr", "R")

  loafercreek$genhz < - generalize.hz(
    loafercreek$hzname,
    n, p)
  
  h <- horizons(loafercreek)
  
table(h$genhz, h$hzname)


vars <- c("genz", "clay", "total_frags_pct",
          "phfield", "effclass")

summary(h[, vars])

sort(unique(h$hzname))

h$hzname <- ifelse(h$hzname == "BT",
                   "Bt", h$hzname)

