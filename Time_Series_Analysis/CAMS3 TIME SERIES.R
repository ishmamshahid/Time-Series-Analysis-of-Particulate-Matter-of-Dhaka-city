cams3_data<- read.csv("CAMS3-DS all date.csv")
summary(cams3_data)
colnames(cams3_data)
cams3_data<-cams3_data[-1]
date<- seq(as.Date('2013-01-01'),as.Date('2018-12-31'),by = 1)
date<-as.POSIXct(strptime(date, format ="%Y-%m-%d" ))

cams3_data<-cbind(date,cams3_data)

plot(cams3_data$date, cams3_data$PM10, type = "l", xlab = "year", ylab = "PM10 ")
rm(Weekly_Means)
# calculate weekly means
Weekly_Means_PM10_3 <- aggregate(cams3_data["PM10"], format(cams3_data["date"],"%Y-%W"),
                               mean, na.rm = TRUE)
# derive the proper sequence of dates
Weekly_Means_PM10_3$date <- seq(min(cams3_data$date), max(cams3_data$date), length = nrow(Weekly_Means_PM10))
# plot the means
plot(Weekly_Means_PM10_3$date, Weekly_Means_PM10_3[, "PM10"],
     type = "l",
     lwd = 1.5,
     pch = 16,
     col = "darkorange2",
     xlab = "year",
     ylab = "PM10",
     ylim = c(0, 450),
     main = "Weekly mean PM10 at CAMS-3.")

grid()
summary(Weekly_Means_PM10_3)
# calculate weekly means
Weekly_Means_PM2.5_3 <- aggregate(cams3_data["PM2.5"], format(cams3_data["date"],"%Y-%W"),
                                mean, na.rm = TRUE)
# derive the proper sequence of dates
Weekly_Means_PM2.5_3$date <- seq(min(cams3_data$date), max(cams3_data$date), length = nrow(Weekly_Means_PM2.5))
# plot the means
plot(Weekly_Means_PM2.5_3$date, Weekly_Means_PM2.5_3[, "PM2.5"],
     type = "l",
     lwd = 1.5,
     pch = 16,
     col = "darkred",
     xlab = "year",
     ylab = "PM2.5",
     ylim = c(0, 300),
     main = "Weekly mean PM2.5 at CAMS-3.")

grid()
summary(Weekly_Means_PM2.5_3)

adf.test(Weekly_Means_PM10$PM10)
adf.test(Weekly_Means_PM2.5$PM2.5)

#install.packages("aTSA")

library(astsa)
library(aTSA)
library(fpp2)
library(ggplot2)
library(lubridate)

PM10.ts_3 <- ts(Weekly_Means_PM10$PM10,freq=365.25/7, start=decimal_date(ymd("2013-01-01")))
PM2.5.ts_3 <- ts(Weekly_Means_PM2.5_3$PM2.5,freq=365.25/7, start=decimal_date(ymd("2013-01-01")))


adf.test(PM10.ts)




#rm(PM2.5.ts.test)

PM10.ts.train<-window(PM10.ts, start = 2013, end = 2018)
PM10.ts.test<-window(PM10.ts, start = 2018, end = 2019.1)
PM2.5.ts.train<-window(PM2.5.ts, start = 2013, end = 2018)
PM2.5.ts.test<-window(PM2.5.ts, start = 2018, end = 2019.1)

summary(Weekly_Means_PM10)
summary(Weekly_Means_PM2.5)




auto.arima(PM10.ts.train)
model<- arima(x=PM10.ts.train, order = c(2,0,2), seasonal = list(order=c(1,1,0), period=52))
values<-forecast(model,h=53)
plot(forecast(model,h=53))

predicted<-values$mean

plot(PM10.ts.actual)
plot(predicted)

cor(PM10.ts.actual,predicted)

library(Metrics)
rmse(PM10.ts.actual,predicted)
mape(predicted,PM10.ts.actual)*100

actual<-as.numeric(PM10.ts.actual)
pred<-as.numeric(predicted)


plot(actual,pred)
abline(coef = c(0,1))
df<-data.frame(actual,pred)
#write.csv(df,"actual and pred")
cor(actual,pred)
rmse(actual,pred)
mape(pred,actual)*100


#negative_to_zero <- function(x) { x[x<0] <- 0; x }
#pred<-negative_to_zero(pred)
#pred

par(mar=c(5, 4, 4, 6) + 1)
plot(PM10.ts.actual,  xlab="", ylab="", 
     type="l",col="red", main="predicted and actual in 2018")


mtext("PM10",side=2,line=2.5)
par(new=TRUE)

plot(predicted , ylab="", 
     axes=FALSE, type="l", col="blue")

legend(2018,100,legend=c("Actual", "Predicted"),
       col=c("red", "blue"), lty=1:1, cex=0.8)




plot(PM10.ts, type="l",col="red", ylab="PM10", main="CAMS1 weekly PM10 data (time series)")

par(new=TRUE)
lines(predicted,   xlab="", ylab="", 
      lty=2,col="blue",lwd=2)

legend(2018.2,380,legend=c("Actual", "Predicted"),
       col=c("red", "blue"), lty=1:2, cex=.7)
grid(lwd=2)


################################################################

Cams1_data<- read.csv("CAMS1 all (PM10 not missing).csv")
summary(Cams1_data)
Cams1_data<-Cams1_data[-1]
Cams1_data<-cbind(date,Cams1_data)
plot(Cams1_data$date, Cams1_data$PM10, type = "l", xlab = "year", ylab = "PM10 ")


PM10_daily.ts <- ts(Cams1_data$PM10,freq=365, start=decimal_date(ymd("2013-01-01")))


Box.test(model$residuals)

plot(model$residuals)
qqnorm(model$residuals)
qqline(model$residuals)

install.packages("FitAR")
library(FitAR)

# residuals of model is to be used inside LBQPlot. no missing residuals allowed
LBQPlot(model$residuals, lag.max = 20)
Box.Ljung.Test(PM10.ts)


?Box.test

resid<-model$residuals
rm(resid)


#Loop through to find the best model as follows:
d=NULL
DD=NULL
d=1
DD=1

per=52
for(p in 1:1){
  for(q in 1:1){
    for(i in 1:3){
      for(j in 1:4){
        if(p+d+q+i+DD+j<=10){
          model<-arima(x=PM10.ts.train, order = c((p-1),d,(q-1)), seasonal = list(order=c((i-1),DD,(j-1)), period=per))
          pval<-Box.test(model$residuals, lag=log(length(model$residuals)))
          sse<-sum(model$residuals^2)
          cat(p-1,d,q-1,i-1,DD,j-1,per, 'AIC=', model$aic, ' SSE=',sse,' p-VALUE=', pval$p.value,'\n')
        }
      }
    }
  }
}


acf(PM10.ts, lag.max = 104)
?acf()
pacf(PM10.ts, lag.max = 104)



?sarima

sarima(PM10.ts.train,2,0,2,1,1,0,52)

plot(PM10.ts.train)


tbatsmodel <- tbats(PM10.ts.train)


tbatsvalues<-forecast(tbatsmodel,h=53)
plot(forecast(tbatsmodel,h=53))

tbatspredicted<-tbatsvalues$mean

plot(PM10.ts.actual)
plot(tbatspredicted)

cor(PM10.ts.actual,tbatspredicted)

rmse(PM10.ts.actual,tbatspredicted)
mae(tbatspredicted,PM10.ts.actual)


nnarmodel <- nnetar(PM10.ts.train)

nnarvalues<-forecast(nnarmodel,h=53)
plot(forecast(nnarmodel,h=53))

nnarpredicted<-nnarvalues$mean

plot(PM10.ts.actual)
plot(nnarpredicted)

cor(PM10.ts.actual,nnarpredicted)

rmse(PM10.ts.actual,nnarpredicted)
mae(nnarpredicted,PM10.ts.actual)










