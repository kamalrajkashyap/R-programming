data("iris")
View(iris)
tapply(iris$Sepal.Width, iris$Species, mean)

iris<-C("iris$Sepal.Length", "iris$Sepal.Width", "iris$Petal.Length")
iris1<-lapply(iris,toupper)
View(iris1)

l <- list(a = 1:10, b = 11:20)
l

lapply(l, mean)

s <- c("SPIDERMAN", "BATMAN", "SUPERMAN")
lapply(s, tolower)


n <- list(a = 1:5, b = seq(4,36,8), c = c(1,3,5,7))
n

lapply(n, sum)

n <- list(a = 1:5, b = seq(4,36,8), c = c(1,3,5,7))
n

sapply(n, sum)

x <-matrix(1:9, nrow = 3, ncol = 3)
apply(x, 2, prod)

apply(x, 2, function(y){y^2})

z <- data.frame(name = c("Kamal", "Akash", "Kunal", "Pradeep", "Amir"), 
                age = c(25,26,28,24,27), 
                gender = factor(c("M", "M", "F", "M", "M")))

tapply(z$age, z$gender, min)
