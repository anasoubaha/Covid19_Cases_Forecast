library(tseries)
library(dataseries)
library(forecast)

#importing the dataset
setwd("C:/Users/MSII/Documents/Serie Chrono")


data<-read.csv("coronadata.csv", header = T)
summary(data)

#presentation graphique
View(data)

#converting it into time series
data.ts<-ts(data$nombre.de.cas,start = 1, frequency = 52*7)
plot(data.ts)

adf.test(data.ts)

dataDiff<-diff(data.ts)
plot(dataDiff)

adf.test(dataDiff)

acf(dataDiff)
pacf(dataDiff)

arima(dataDiff, order = c(1,0,1))###
arima(dataDiff, order = c(2,0,2))####
arima(dataDiff, order = c(1,0,2))#
arima(dataDiff, order = c(1,0,3))
arima(dataDiff, order = c(2,0,3))##


auto.arima(dataDiff, seasonal = FALSE)

plot(dataDiff)
model<-tseries::arma(dataDiff, order = c(2,2))
lines(model$fitted.value, col="red")

arima202<-arima(dataDiff, order = c(2,0,2))
dataPred<-predict(arima202,n.ahead=100)
plot(dataDiff)
lines(model$fitted.value, col="red")
lines(dataPred$pred, col="blue")
#lines(dataPred$pred+2*dataPred$pred, col="red")
#lines(dataPred$pred-2*dataPred$pred, col="red")


checkresiduals(arima202)

summary(model)

