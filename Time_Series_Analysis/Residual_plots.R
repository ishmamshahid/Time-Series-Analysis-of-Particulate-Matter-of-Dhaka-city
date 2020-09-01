############residual plot of SARIMA pm10########
par(mfrow=c(3,2))
plot(sarima_pm10_1$residuals,main="Residuals (PM10, CAMS-1)",ylab="Residuals")
qqnorm(sarima_pm10_1$residuals)
qqline(sarima_pm10_1$residuals)

plot(sarima_pm10_2$residuals,main="Residuals (PM10, CAMS-2)",ylab="Residuals")
qqnorm(sarima_pm10_2$residuals)
qqline(sarima_pm10_2$residuals)

plot(sarima_pm10_3$residuals,main="Residuals (PM10, CAMS-3)",ylab="Residuals")
qqnorm(sarima_pm10_3$residuals)
qqline(sarima_pm10_3$residuals)



############residual plot of SARIMA pm2.5#########
par(mfrow=c(3,2))
plot(sarima_pm2.5_1$residuals,main="Residuals (PM2.5, CAMS-1)",ylab="Residuals")
qqnorm(sarima_pm2.5_1$residuals)
qqline(sarima_pm2.5_1$residuals)

plot(sarima_pm2.5_2$residuals,main="Residuals (PM2.5, CAMS-2)",ylab="Residuals")
qqnorm(sarima_pm2.5_2$residuals)
qqline(sarima_pm2.5_2$residuals)

plot(sarima_pm2.5_3$residuals,main="Residuals (PM2.5, CAMS-3)",ylab="Residuals")
qqnorm(sarima_pm2.5_3$residuals)
qqline(sarima_pm2.5_3$residuals)