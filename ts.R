#concider the anual rainfall details at a place starting from a january 2012. we need to creat a R time series of obj for a period of 12 months and plot it.
X = c(799,1174.8,865.1,1334.6,635.4,918.5,685.5,998.6,784.2,985,882.8,1071)
length(X)
time <- ts(X, start = c(2012,1), frequency = 12 )
print(time)
plot(time)
