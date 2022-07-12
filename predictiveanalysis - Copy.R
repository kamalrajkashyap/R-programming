#general syntax - forecast = predict(model,value)

#Example 1
#GGally -  create a plot matrix for the data visualization.
install.packages("GGally")
install.packages("forecast")
library(GGally)
data(women)
head(women)

ggpairs(data=women, columns=1:2, title="Death rate")
fit_ex <- lm(height ~ weight, data = women)
ggplot(data=women, aes(fit_ex$residuals)) +
  geom_histogram(binwidth = 1, color = "green", fill = "yellow") +
  theme(panel.background = element_rect(fill = "red"),
        axis.line.x=element_line(),
        axis.line.y=element_line()) +
  ggtitle("Histogram for women height")

ggplot(data = women, aes(x = height, y = weight)) +
  geom_point() +
  stat_smooth(method = "lm", col = "blue") +
  theme(panel.background = element_rect(fill = "grey"),
        axis.line.x=element_line(),
        axis.line.y=element_line()) +
  ggtitle("Linear Model fitted to above data")

predict(fit_ex, data.frame(weight = 70.2))
summary(fit_ex)

#Example -2 
x <- c(680, 8713, 18166, 64287, 71600,
       98521, 65324, 152114, 115843,
       531267, 896851, 208725, 3072113)
library(lubridate)
library(forecast)
cts <- ts(x, start = decimal_date(ymd("2021-02-21")),frequency = 365.25 / 6)
fit <- auto.arima(cts)
forecast(fit, 4)
plot(forecast(fit, 5), xlab ="Weekly purchase of medicine",ylab ="Total income",main ="purchase vs Income", col.main ="blue")
