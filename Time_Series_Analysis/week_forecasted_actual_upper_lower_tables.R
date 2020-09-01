?mutate_if
library(dplyr)
options(scipen = 999)  
#######WEEK DATES######
Week_start<- seq(as.Date('2017-12-09'),as.Date('2019-01-05'),by = 7)
Week_start<-as.POSIXct(strptime(Week_start, format ="%Y-%m-%d" ))
Week_end<- seq(as.Date('2017-12-15'),as.Date('2019-01-11'),by = 7)
Week_end<-as.POSIXct(strptime(Week_end, format ="%Y-%m-%d" ))
Week_start<-as.character(Week_start)
Week_end<-as.character(Week_end)
###########PM10(CAMS-1)######
sarima_pred_pm10_1_lower<-sarima_pred_pm10_1$lower
sarima_pred_pm10_1_lower<-sarima_pred_pm10_1_lower[,1]

sarima_pred_pm10_1_upper<-sarima_pred_pm10_1$upper
sarima_pred_pm10_1_upper<-sarima_pred_pm10_1_upper[,1]

df_PM10_1<-data.frame(Week_start,Week_end,PM10.ts.test,sarima_pred_pm10_1_mean,sarima_pred_pm10_1_lower,sarima_pred_pm10_1_upper) 
df_PM10_1<-df_PM10_1 %>% 
  mutate_if(is.numeric, round, digits=2)
colnames(df_PM10_1)<-c("Week start","Week end","Actual PM10","Forecasted PM10","95% CI (Lower)","95% CI (Upper)")
df_PM10_1$`95% CI (Lower)`<-  ifelse(df_PM10_1$`95% CI (Lower)` < 0, 0, df_PM10_1$`95% CI (Lower)`)
#Directory must be changed if data frame is to be written in csv. However values had been extracted before in csv and rearranged in tabular format to be added in the thesis.The csv in the final format have been provided in the files of the current working directory. 
#write.csv(df_PM10_1,"C:/Users/Asus/Desktop/@Thesis DATA-2020April27/@THESIS PRELIMINARY DATA ANALYSIS/25July/CAMS1 TIME SERIES/exported_csv/PM10_Forecasted.csv")  


##########PM2.5 (CAMS-1)#########
sarima_pred_pm2.5_1_lower<-sarima_pred_pm2.5_1$lower
sarima_pred_pm2.5_1_lower<-sarima_pred_pm2.5_1_lower[,1]

sarima_pred_pm2.5_1_upper<-sarima_pred_pm2.5_1$upper
sarima_pred_pm2.5_1_upper<-sarima_pred_pm2.5_1_upper[,1]

df_PM2.5_1<-data.frame(Week_start,Week_end,PM2.5.ts.test,sarima_pred_pm2.5_1_mean,sarima_pred_pm2.5_1_lower,sarima_pred_pm2.5_1_upper) 
df_PM2.5_1<-df_PM2.5_1 %>% 
  mutate_if(is.numeric, round, digits=2)
colnames(df_PM2.5_1)<-c("Week start","Week end","Actual PM2.5","Forecasted PM2.5","95% CI (Lower)","95% CI (Upper)")
df_PM2.5_1$`95% CI (Lower)`<-  ifelse(df_PM2.5_1$`95% CI (Lower)` < 0, 0, df_PM2.5_1$`95% CI (Lower)`)
#Directory must be changed if data frame is to be written in csv. However values had been extracted before in csv and rearranged in tabular format to be added in the thesis.The csv in the final format have been provided in the files of the current working directory. 
#write.csv(df_PM2.5_1,"C:/Users/Asus/Desktop/@Thesis DATA-2020April27/@THESIS PRELIMINARY DATA ANALYSIS/25July/CAMS1 TIME SERIES/exported_csv/PM2.5_Forecasted.csv")  


###########PM10(CAMS-2)######
sarima_pred_pm10_2_lower<-sarima_pred_pm10_2$lower
sarima_pred_pm10_2_lower<-sarima_pred_pm10_2_lower[,1]

sarima_pred_pm10_2_upper<-sarima_pred_pm10_2$upper
sarima_pred_pm10_2_upper<-sarima_pred_pm10_2_upper[,1]

df_PM10_2<-data.frame(Week_start,Week_end,PM10.ts.test_2,sarima_pred_pm10_2_mean,sarima_pred_pm10_2_lower,sarima_pred_pm10_2_upper) 
df_PM10_2<-df_PM10_2 %>% 
  mutate_if(is.numeric, round, digits=2)
colnames(df_PM10_2)<-c("Week start","Week end","Actual PM10","Forecasted PM10","95% CI (Lower)","95% CI (Upper)")
df_PM10_2$`95% CI (Lower)`<-  ifelse(df_PM10_2$`95% CI (Lower)` < 0, 0, df_PM10_2$`95% CI (Lower)`)
#Directory must be changed if data frame is to be written in csv. However values had been extracted before in csv and rearranged in tabular format to be added in the thesis.The csv in the final format have been provided in the files of the current working directory. 
#write.csv(df_PM10_2,"C:/Users/Asus/Desktop/@Thesis DATA-2020April27/@THESIS PRELIMINARY DATA ANALYSIS/25July/CAMS1 TIME SERIES/exported_csv/PM10_2_Forecasted.csv") 


##########PM2.5 (CAMS-2)#########
sarima_pred_pm2.5_2_lower<-sarima_pred_pm2.5_2$lower
sarima_pred_pm2.5_2_lower<-sarima_pred_pm2.5_2_lower[,1]

sarima_pred_pm2.5_2_upper<-sarima_pred_pm2.5_2$upper
sarima_pred_pm2.5_2_upper<-sarima_pred_pm2.5_2_upper[,1]

df_PM2.5_2<-data.frame(Week_start,Week_end,PM2.5.ts.test_2,sarima_pred_pm2.5_2_mean,sarima_pred_pm2.5_2_lower,sarima_pred_pm2.5_2_upper) 
df_PM2.5_2<-df_PM2.5_2 %>% 
  mutate_if(is.numeric, round, digits=2)
colnames(df_PM2.5_2)<-c("Week start","Week end","Actual PM2.5","Forecasted PM2.5","95% CI (Lower)","95% CI (Upper)")
df_PM2.5_2$`95% CI (Lower)`<-  ifelse(df_PM2.5_2$`95% CI (Lower)` < 0, 0, df_PM2.5_2$`95% CI (Lower)`)
#Directory must be changed if data frame is to be written in csv. However values had been extracted before in csv and rearranged in tabular format to be added in the thesis.The csv in the final format have been provided in the files of the current working directory. 
#write.csv(df_PM2.5_2,"C:/Users/Asus/Desktop/@Thesis DATA-2020April27/@THESIS PRELIMINARY DATA ANALYSIS/25July/CAMS1 TIME SERIES/exported_csv/PM2.5_Forecasted_2.csv")  


###########PM10(CAMS-3)######
sarima_pred_pm10_3_lower<-sarima_pred_pm10_3$lower
sarima_pred_pm10_3_lower<-sarima_pred_pm10_3_lower[,1]

sarima_pred_pm10_3_upper<-sarima_pred_pm10_3$upper
sarima_pred_pm10_3_upper<-sarima_pred_pm10_3_upper[,1]

df_PM10_3<-data.frame(Week_start,Week_end,PM10.ts.test_3,sarima_pred_pm10_3_mean,sarima_pred_pm10_3_lower,sarima_pred_pm10_3_upper) 
df_PM10_3<-df_PM10_3 %>% 
  mutate_if(is.numeric, round, digits=2)
colnames(df_PM10_3)<-c("Week start","Week end","Actual PM10","Forecasted PM10","95% CI (Lower)","95% CI (Upper)")
df_PM10_3$`95% CI (Lower)`<-  ifelse(df_PM10_3$`95% CI (Lower)` < 0, 0, df_PM10_3$`95% CI (Lower)`)
#Directory must be changed if data frame is to be written in csv. However values had been extracted before in csv and rearranged in tabular format to be added in the thesis.The csv in the final format have been provided in the files of the current working directory. 
#write.csv(df_PM10_3,"C:/Users/Asus/Desktop/@Thesis DATA-2020April27/@THESIS PRELIMINARY DATA ANALYSIS/25July/CAMS1 TIME SERIES/exported_csv/PM10_Forecasted_3.csv")  


##########PM2.5 (CAMS-3)#########
sarima_pred_pm2.5_3_lower<-sarima_pred_pm2.5_3$lower
sarima_pred_pm2.5_3_lower<-sarima_pred_pm2.5_3_lower[,1]

sarima_pred_pm2.5_3_upper<-sarima_pred_pm2.5_3$upper
sarima_pred_pm2.5_3_upper<-sarima_pred_pm2.5_3_upper[,1]

df_PM2.5_3<-data.frame(Week_start,Week_end,PM2.5.ts.test_3,sarima_pred_pm2.5_3_mean,sarima_pred_pm2.5_3_lower,sarima_pred_pm2.5_3_upper) 
df_PM2.5_3<-df_PM2.5_3 %>% 
  mutate_if(is.numeric, round, digits=2)
colnames(df_PM2.5_3)<-c("Week start","Week end","Actual PM2.5","Forecasted PM2.5","95% CI (Lower)","95% CI (Upper)")
df_PM2.5_3$`95% CI (Lower)`<-  ifelse(df_PM2.5_3$`95% CI (Lower)` < 0, 0, df_PM2.5_3$`95% CI (Lower)`)
#Directory must be changed if data frame is to be written in csv. However values had been extracted before in csv and rearranged in tabular format to be added in the thesis.The csv in the final format have been provided in the files of the current working directory. 
#write.csv(df_PM2.5_3,"C:/Users/Asus/Desktop/@Thesis DATA-2020April27/@THESIS PRELIMINARY DATA ANALYSIS/25July/CAMS1 TIME SERIES/exported_csv/PM2.5_Forecasted_3.csv")  

