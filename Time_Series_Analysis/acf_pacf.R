par(mfrow=c(3,2))
plot(acf(PM10.ts_1[46:318], lag.max = 104,plot=F),xaxp=c(0,104,2),main="Plot of ACF of PM10 (CAMS-1)")
plot(pacf(PM10.ts_1[46:318], lag.max = 104,plot=F),xaxp=c(0,104,2),main="Plot of PACF of PM10 (CAMS-1)")
plot(acf(PM10.ts_2[54:318], lag.max = 104,plot=F),xaxp=c(0,104,2),main="Plot of ACF of PM10 (CAMS-2)")
plot(pacf(PM10.ts_2[54:318], lag.max = 104,plot=F),xaxp=c(0,104,2),main="Plot of PACF of PM10 (CAMS-2)")
plot(acf(PM10.ts_3[1:318], lag.max = 104,plot=F),xaxp=c(0,104,2),main="Plot of ACF of PM10 (CAMS-3)")
plot(pacf(PM10.ts_3[1:318], lag.max = 104,plot=F),xaxp=c(0,104,2),main="Plot of PACF of PM10 (CAMS-3)")


par(mfrow=c(3,2))
plot(acf(PM2.5.ts_1[54:318], lag.max = 104,plot=F),xaxp=c(0,104,2),main="Plot of ACF of PM2.5 (CAMS-1)")
plot(pacf(PM2.5.ts_1[54:318], lag.max = 104,plot=F),xaxp=c(0,104,2),main="Plot of PACF of PM2.5 (CAMS-1)")
plot(acf(PM2.5.ts_2[54:318], lag.max = 104,plot=F),xaxp=c(0,104,2),main="Plot of ACF of PM2.5 (CAMS-2)")
plot(pacf(PM2.5.ts_2[54:318], lag.max = 104,plot=F),xaxp=c(0,104,2),main="Plot of PACF of PM2.5 (CAMS-2)")
plot(acf(PM2.5.ts_3[1:318], lag.max = 104,plot=F),xaxp=c(0,104,2),main="Plot of ACF of PM2.5 (CAMS-3)")
plot(pacf(PM2.5.ts_3[1:318], lag.max = 104,plot=F),xaxp=c(0,104,2),main="Plot of PACF of PM2.5 (CAMS-3)")

