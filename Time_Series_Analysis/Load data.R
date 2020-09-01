CAMS1<-read.csv("CAMS1-SANGSAD all date.csv")
CAMS2<-read.csv("CAMS2-FARMGATE all date.csv")
CAMS3<-read.csv("CAMS3-DS all date.csv")

summary(CAMS3)

CAMS1<-CAMS1[-1]
date<- seq(as.Date('2013-01-01'),as.Date('2018-12-31'),by = 1)
date<-as.POSIXct(strptime(date, format ="%Y-%m-%d" ))

CAMS1<-cbind(date,CAMS1)

plot(CAMS1$date[1827:2191], CAMS1$PM10[1827:2191], type = "l", xlab = "year", ylab = "PM10 ", main="PM10 Time series of CAMS1", col="dark red")
grid (col= " blue")
plot(CAMS1$date, CAMS1$PM2.5, type = "l", xlab = "year", ylab = "PM2.5 ", main="PM2.5 Time series of CAMS1", col="dark blue")
grid(col="red")

?plot()


CAMS2<-CAMS2[-1]
CAMS2<-cbind(date,CAMS2)

plot(CAMS2$date[1827:2191], CAMS2$PM10[1827:2191], type = "l", xlab = "year", ylab = "PM10 ", main="PM10 Time series of CAMS2", col="dark red")
grid (col= " blue")
plot(CAMS2$date, CAMS2$PM2.5, type = "l", xlab = "year", ylab = "PM2.5 ", main="PM2.5 Time series of CAMS2", col="dark blue")
grid(col="red")



CAMS3<-CAMS3[-1]
CAMS3<-cbind(date,CAMS3)

plot(CAMS3$date[1827:2191], CAMS3$PM10[1827:2191], type = "l", xlab = "year", ylab = "PM10 ", main="PM10 Time series of CAMS3", col="dark red")
grid (col= " blue")
plot(CAMS3$date, CAMS3$PM2.5, type = "l", xlab = "year", ylab = "PM2.5 ", main="PM2.5 Time series of CAMS3", col="dark blue")
grid(col="red")


library(openair)

calendarPlot(CAMS1, pollutant = "PM10", year =2018,main = "PM10 concentration in 2018 (CAMS-1)")
calendarPlot(CAMS2, pollutant = "PM2.5", annotate = "value", lim =65,year =2018,
             cols = "Purples", col.lim = c("black", "orange"),main = "PM2.5 concentration values (microgram/m3) in 2018 (CAMS-2)")


calendarPlot(CAMS3, pollutant = "PM10",year =2018, breaks = c(0, 50, 100, 150, 1000),
             labels = c("Very low (<50)", "Low (50-100)", "High (100-150)", "Beyond National Standards (>150)"),
             cols = c("lightblue", "forestgreen", "yellow", "red"),main = "PM10 concentration (categorized) in 2018 (CAMS-3)")



CAMS1_13_17<- read.csv("CAMS1-SANGSAD 13-17.csv")

date_13_17<- seq(as.Date('2013-01-01'),as.Date('2017-12-31'),by = 1)
date_13_17<-as.POSIXct(strptime(date_13_17, format ="%Y-%m-%d" ))

CAMS1_13_17<-CAMS1_13_17[-1]
CAMS1_13_17<-cbind(date_13_17,CAMS1_13_17)

colnames(CAMS1_13_17)<- c("date","Temp","ws", "SolarRad","Rainfall","Humidity", "PM10","PM2.5","wd")


windRose(CAMS1_13_17, breaks = c(1,2,3,4))

?windRose

pollutionRose(CAMS1_13_17, pollutant = "PM10")

polarPlot(CAMS1_13_17, pollutant = "PM10")


polarPlot(CAMS1_13_17, pollutant = c("PM2.5", "PM10"), statistic = "r")

?polarPlot

?windRose

summary(CAMS1_13_17)




