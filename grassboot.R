library(readr)
grass <- read.csv("C:/Users/Dell/Downloads/grass.csv")
View(grass)
names(grass)
levels(grass$graze)

table(grass$graze)
attach(grass)

table(graze)

boxplot(rich ~ graze, las=1, ylab= "graze", xlab="rich", main="Rich and graze")

mean(rich[graze=="mow"])
mean(rich[graze=="unmow"])

# weight - rich ; feed - graze ; casein - mow ; meatmeal - unmow

test.stat1 <- abs(mean(rich[graze=="mow"])- mean(rich[graze=="unmow"]))
test.stat1


#############################################################
########### BOOT sTRAP#######################################
##############################################################
set.seed(112358) # for reproducibility
n <-length(graze)
n
B <- 10000   # number of bootstrap samples
variable <- rich   #variable we will reample from

# now get bootstrap samples ( without loops!)
BootstrapSamples <- matrix(sample(variable,size=n*B, replace=TRUE), nrow=n,ncol=B)
dim(BootstrapSamples)

# now calculate the means (Yc and Ym) for each of the bootstrap samples
#( the ineffficient but transparent way... best to start simple and once working
#well then make code efficient)
#initialize the vector to store the TEST-STATS
Boot.test.stat1 <- rep(0,B)
Boot.test.stat2 <- rep(0,B)
#run through a loop, each time calculating the bootstrap test.stat
# NOTE: could make this faster by writing a "function" and then
# using apply to apply it to columns of "BootSamples"

for (i in 1:B) {
  #calculate the boot-test-stat1 and save it
  Boot.test.stat1[i] <- abs(mean(BootstrapSamples[1:3,i]) - 
                              mean(BootstrapSamples[4:9,i]))
}

#OBSERVED TEST STATS
test.stat1;

#take a look at first 20 bootstrap -TEST Stats for 1 and 2
round(Boot.test.stat1[1:20],1)

# let's calculate the bootstrap p-value
#Notice how we can ask R for a try/false question ( for first 20)
(Boot.test.stat1 >=test.stat1)[1:20]
# if we ask for the mean of all those, it treats 0=FALSE, 1=TRUE
#..calculate p-value
mean(Boot.test.stat1 >=test.stat1)

table(grass)

plot(density(Boot.test.stat1),
     xlab=expression(group("|", bar(Yc)-bar(Ym),"|")))
