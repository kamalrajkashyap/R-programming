data("mtcars")

newdata<-mtcars[,c(1:7,10,11)]
head(newdata)
install.packages("GGally")
library(GGally)

ggpairs(newdata)

pc<-prcomp(newdata,center = TRUE,scale = TRUE)
summary(pc)
attributes(pc)
print(pc)
var1<-round(pc$sdev[1]^2/sum(pc$sdev^2)*100,2)
var2<-round(pc$sdev[2]^2/sum(pc$sdev^2)*100,2)

plot(pc)
screeplot(x=pc,type="line",main = "Screen plot")

installed.packages("factoextra")
library(factoextra)
installed.packages("ggplot2")
library(ggplot2)
fviz_eig(pc)

#PCA
biplot(pc,cex=0.5)
#install.packages("ggfortify")
library(ggfortify)
autoplot(pc,scale = 0)
mtcars$vs<-factor(mtcars$vs)
mtcars$am<-factor(mtcars$am)
autoplot(pc,data = mtcars,colour="am",
         loadings=TRUE,loadings.colour="blue",
         loadings,label=TRUE,
         loadings.label.size=3)

fviz_pca_ind(pc,
             col.ind = "cos2",
             gradient.cols=c("#OOAFBB", "#E7B800", "#FC4E07"),
             repel = TRUE)

fviz_pca_var(pc,
             col.var = "contrib",
             gradient.cols=c("#OOAFBB", "#E7B800", "#FC4E07"),
             repel = TRUE)

fviz_pca_biplot(pc,
                repel = TRUE,
                col.var = "#2E9FDF",
                col.ind = "#696969")

fviz_pca_ind(pc,
             col.ind = mtcars$am,
             palette = c("red", "blue"),
             addEllipses = TRUE,
             legend.title="am",
             xlab=paste("pc1(",var1,"%)",sep = ""),
             ylab=paste("pc2(",var2,"%)",sep = ""),
             repel=TRUE)
