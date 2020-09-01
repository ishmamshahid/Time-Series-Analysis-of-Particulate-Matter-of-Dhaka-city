?auto.arima()
?sarima
library(forecast)
library(lmtest)
library(astsa)
library(fpp2)
library(ggplot2)
library(lubridate)
library(FitAR)
options(warn=-1)
auto.arima(PM10.ts.train,allowdrift = F) #ok
sarima(PM10.ts.train_2,3,0,1,1,1,0,52) #ok
auto.arima(PM10.ts.train_3) #ok

auto.arima(PM2.5.ts.train) #ok
auto.arima(PM2.5.ts.train_2,allowdrift = F) #ok
auto.arima(PM2.5.ts.train_3) #ok


##################SARIMA model PM10 all stations#############
sarima_pm10_1<- arima(x=PM10.ts.train, order = c(0,0,0), seasonal = list(order=c(1,1,0), period=52))
sarima_pred_pm10_1<-forecast(sarima_pm10_1,h=57,level= c(95,95))
sarima_pred_pm10_1_mean<-sarima_pred_pm10_1$mean



sarima_pm10_2<- arima(x=PM10.ts.train_2, order = c(3,0,1), seasonal = list(order=c(1,1,0), period=52))
sarima_pred_pm10_2<-forecast(sarima_pm10_2,h=57,level= c(95,95))
sarima_pred_pm10_2_mean<-sarima_pred_pm10_2$mean



sarima_pm10_3<- arima(x=PM10.ts.train_3, order = c(2,0,2), seasonal = list(order=c(1,1,0), period=52))
sarima_pred_pm10_3<-forecast(sarima_pm10_3,h=57,level= c(95,95))
sarima_pred_pm10_3_mean<-sarima_pred_pm10_3$mean


par(mfrow=c(3,1))
##########PLOT of PM10 CAMS-1#############
plot(PM10.ts, type="l",col="red", ylab="PM10",lwd=3, main="CAMS1 weekly PM10 data (time series)")

par(new=TRUE)
lines(sarima_pred_pm10_1_mean,   xlab="", ylab="", 
      lty=2,col="blue",lwd=4)

legend(2018.1,400,legend=c("Actual", "Predicted"),
       col=c("red", "blue"), lty=1:2, cex=1,bty="n")
grid()
##########PLOT of PM10 CAMS-2#############
plot(PM10.ts_2, type="l",col="red", ylab="PM10",lwd=3, main="CAMS2 weekly PM10 data (time series)")

par(new=TRUE)
lines(sarima_pred_pm10_2_mean,   xlab="", ylab="", 
      lty=2,col="blue",lwd=4)

legend(2018.4,600,legend=c("Actual", "Predicted"),
       col=c("red", "blue"), lty=1:2, cex=1,bty="n")
grid()
##########PLOT of PM10 CAMS-3#############
plot(PM10.ts_3, type="l",col="red", ylab="PM10",lwd=3, main="CAMS3 weekly PM10 data (time series)")

par(new=TRUE)
lines(sarima_pred_pm10_3_mean,   xlab="", ylab="", 
      lty=2,col="blue",lwd=4)

legend(2018.2,500,legend=c("Actual", "Predicted"),
       col=c("red", "blue"), lty=1:2, cex=1,bty = "n")
grid()


######################

?legend()

   library(ggpubr)
library(ggfortify)
library(changepoint)
library(strucchange)
library(ggpmisc)






##################SARIMA model PM2.5 all station#############
sarima_pm2.5_1<- arima(x=PM2.5.ts.train, order = c(4,0,0), seasonal = list(order=c(1,1,0), period=52))
sarima_pred_pm2.5_1<-forecast(sarima_pm2.5_1,h=57,level= c(95,95))
sarima_pred_pm2.5_1_mean<-sarima_pred_pm2.5_1$mean

sarima_pm2.5_2<- arima(x=PM2.5.ts.train_2, order = c(0,0,0), seasonal = list(order=c(1,1,0), period=52))
sarima_pred_pm2.5_2<-forecast(sarima_pm2.5_2,h=57,level= c(95,95))
sarima_pred_pm2.5_2_mean<-sarima_pred_pm2.5_2$mean

sarima_pm2.5_3<- arima(x=PM2.5.ts.train_3, order = c(4,0,0), seasonal = list(order=c(1,1,0), period=52))
sarima_pred_pm2.5_3<-forecast(sarima_pm2.5_3,h=57,level= c(95,95))
sarima_pred_pm2.5_3_mean<-sarima_pred_pm2.5_3$mean





par(mfrow=c(3,1))
##########PLOT of PM2.5 CAMS-1#######
plot(PM2.5.ts, type="l",col="orange3", ylab="PM2.5",lwd=2, main="CAMS1 weekly PM2.5 data (time series)")

par(new=TRUE)
lines(sarima_pred_pm2.5_1_mean,   xlab="", ylab="", 
      lty=2,col="midnightblue",lwd=3)

legend(2018.3,250,legend=c("Actual", "Predicted"),
       col=c("orange3", "midnightblue"), lty=1:2, cex=.7)
grid()
##########PLOT of PM2.5 CAMS-2#######
plot(PM2.5.ts_2, type="l",col="orange3", ylab="PM2.5",lwd=2, main="CAMS2 weekly PM2.5 data (time series)")

par(new=TRUE)
lines(sarima_pred_pm2.5_2_mean,   xlab="", ylab="", 
      lty=2,col="midnightblue",lwd=3)

legend(2018.4,350,legend=c("Actual", "Predicted"),
       col=c("orange3", "midnightblue"), lty=1:2, cex=.7)
grid()
##########PLOT of PM2.5 CAMS-3#######
plot(PM2.5.ts_3, type="l",col="orange3", ylab="PM2.5",lwd=2, main="CAMS3 weekly PM2.5 data (time series)")

par(new=TRUE)
lines(sarima_pred_pm2.5_3_mean,   xlab="", ylab="", 
      lty=2,col="midnightblue",lwd=3)

legend(2018.4,275,legend=c("Actual", "Predicted"),
       col=c("orange3", "midnightblue"), lty=1:2, cex=.7)
grid()

coeftest(sarima_pm10_3)






















