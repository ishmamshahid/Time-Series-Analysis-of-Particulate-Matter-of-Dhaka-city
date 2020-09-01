par(mfrow=c(3,2))
plot(acf(diff(PM10.ts[46:318], differences = 1,lag = 52),lag.max = 104,plot = F),xaxp=c(0,104,2),main="ACF of de-seasonalized and stationary data (CAMS-1, PM10)")
plot(pacf(diff(PM10.ts[46:318], differences = 1,lag = 52),lag.max = 104,plot = F),xaxp=c(0,104,2),main="PACF of de-seasonalized and stationary data (CAMS-1, PM10)")

plot(acf(diff(PM10.ts_2[54:318], differences = 1,lag = 52),lag.max = 104,plot = F),xaxp=c(0,104,2),main="ACF of de-seasonalized and stationary data (CAMS-2, PM10)")
plot(pacf(diff(PM10.ts_2[54:318], differences = 1,lag = 52),lag.max = 104,plot = F),xaxp=c(0,104,2),main="PACF of de-seasonalized and stationary data (CAMS-2, PM10)")

plot(acf(diff(PM10.ts_3[1:318], differences = 1,lag = 52),lag.max = 104,plot = F),xaxp=c(0,104,2),main="ACF of de-seasonalized and stationary data (CAMS-3, PM10)")
plot(pacf(diff(PM10.ts_3[1:318], differences = 1,lag = 52),lag.max = 104,plot = F),xaxp=c(0,104,2),main="PACF of de-seasonalized and stationary data (CAMS-3, PM10)")


par(mfrow=c(3,2))
plot(acf(diff(PM2.5.ts[54:318], differences = 1,lag = 52),lag.max = 104,plot = F),xaxp=c(0,104,2),main="ACF of de-seasonalized and stationary data (CAMS-1, PM2.5)")
plot(pacf(diff(PM2.5.ts[54:318], differences = 1,lag = 52),lag.max = 104,plot = F),xaxp=c(0,104,2),main="PACF of de-seasonalized and stationary data (CAMS-1, PM2.5)")

plot(acf(diff(PM2.5.ts_2[54:318], differences = 1,lag = 52),lag.max = 104,plot = F),xaxp=c(0,104,2),main="ACF of de-seasonalized and stationary data (CAMS-2, PM2.5)")
plot(pacf(diff(PM2.5.ts_2[54:318], differences = 1,lag = 52),lag.max = 104,plot = F),xaxp=c(0,104,2),main="PACF of de-seasonalized and stationary data (CAMS-2, PM2.5)")

plot(acf(diff(PM2.5.ts_3[1:318], differences = 1,lag = 52),lag.max = 104,plot = F),xaxp=c(0,104,2),main="ACF of de-seasonalized and stationary data (CAMS-3, PM2.5)")
plot(pacf(diff(PM2.5.ts_3[1:318], differences = 1,lag = 52),lag.max = 104,plot = F),xaxp=c(0,104,2),main="PACF of de-seasonalized and stationary data (CAMS-3, PM2.5)")




