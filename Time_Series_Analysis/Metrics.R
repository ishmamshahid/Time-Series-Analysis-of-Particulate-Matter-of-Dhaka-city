library(Metrics)
library(dplyr)
#rm(test_metrics)

##########Rough DATAFrame#############

#rm(test_metrics)
test_metrics<-data.frame("RMSE"=rmse(PM2.5.ts.test,sarima_pred_pm2.5_1_mean),
                         "MAE"=mae(PM2.5.ts.test,sarima_pred_pm2.5_1_mean),
                         "Cor.Coeff"=cor(PM2.5.ts.test,sarima_pred_pm2.5_1_mean))

test_metrics<-rbind(test_metrics,c(rmse(PM2.5.ts.test_2,sarima_pred_pm2.5_2_mean),
                                   mae(PM2.5.ts.test_2,sarima_pred_pm2.5_2_mean),
                                   cor(PM2.5.ts.test_2,sarima_pred_pm2.5_2_mean) ))

test_metrics<-rbind(test_metrics,c(rmse(PM2.5.ts.test_3,sarima_pred_pm2.5_3_mean),
                                   mae(PM2.5.ts.test_3,sarima_pred_pm2.5_3_mean),
                                   cor(PM2.5.ts.test_3,sarima_pred_pm2.5_3_mean) ))




#######################
rmse(PM2.5.ts.test,sarima_pred_pm2.5_1_mean)
mae(PM2.5.ts.test,sarima_pred_pm2.5_1_mean)
cor(PM2.5.ts.test,sarima_pred_pm2.5_1_mean)


rmse(PM2.5.ts.test_2,sarima_pred_pm2.5_2_mean)
mae(PM2.5.ts.test_2,sarima_pred_pm2.5_2_mean)
cor(PM2.5.ts.test_2,sarima_pred_pm2.5_2_mean)


rmse(PM2.5.ts.test_3,sarima_pred_pm2.5_3_mean)
mae(PM2.5.ts.test_3,sarima_pred_pm2.5_3_mean)
cor(PM2.5.ts.test_3,sarima_pred_pm2.5_3_mean)





























