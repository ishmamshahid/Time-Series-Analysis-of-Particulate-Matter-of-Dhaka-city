library(astsa)
library(fpp2)
library(ggplot2)
library(lubridate)

nnetar()

tbats_pm2.5_3<-tbats(PM2.5.ts.train_3)
tbats_pred_pm2.5_3<-forecast(tbats_pm2.5_3,h=57)
TBATS_pred_pm2.5_3<-tbats_pred_pm2.5_3$mean

nnar_pm2.5_3<- nnetar(PM2.5.ts.train_3)
nnar_pred_pm2.5_3<-forecast(nnar_pm2.5_3,h=57)
NNAR_pred_pm2.5_3<-nnar_pred_pm2.5_3$mean






pm2.5_metrics_df_3<-data.frame(rbind(postResample(sarima_pred_pm2.5_3_mean,PM2.5.ts.test_3),
                          postResample(TBATS_pred_pm2.5_3,PM2.5.ts.test_3),
                          postResample(NNAR_pred_pm2.5_3,PM2.5.ts.test_3)))

row.names(pm2.5_metrics_df_3)<-c("SARIMA","TBATS","NNAR")

print("Comparison between different time series models  for PM 2.5 (CAMS-3)")
pm2.5_metrics_df_3







plot(tbats_pred_pm2.5_3)
plot(nnar_pred_pm2.5_3)


