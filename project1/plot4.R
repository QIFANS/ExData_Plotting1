#Sys.setlocale("LC_TIME", "American")
#set workspace
#setwd("E:/Git repository/Exploratory Data Analysis/project1")
#create data file
if(!file.exists("data")){
  dir.create("data")
}
#download file
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,destfile="data/exdata_data_household_power_consumption.zip")
#import data into Rstudio
file<-unzip("data/exdata_data_household_power_consumption.zip")
dt<-read.table(file,header=T,sep=";",as.is=F,na.strings=c("",NA,"?"))
dt<-data.frame(Date=as.Date(dt$Date,format="%d/%m/%Y"),dt[,c(-1)])
dt<-dt[dt$Date==as.Date("2007-02-01")|dt$Date==as.Date("2007-02-02"),]
dt<-data.frame(Date=as.POSIXct(strptime(paste(dt$Date,dt$Time,sep=" "), format="%Y-%m-%d %H:%M:%S")),dt[,c(-1,-2)])
#plot
png(filename = "plot4.png",width = 480, height = 480, units = "px")
par(mfrow=c(2,2),mar=c(5,4,4,2),cex.lab=1.1)
#figure1
with(dt,plot(Date,Global_active_power,type="l",xlab="",ylab="Global Active Power"))
#figure2
with(dt,plot(Date,Voltage,type="l",xlab="datetime",ylab="Voltage"))
#figure3
with(dt,plot(Date,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(dt,lines(Date,Sub_metering_2,col="red"))
with(dt,lines(Date,Sub_metering_3,col="blue"))
legend("topright",box.lty = "blank",lty="solid",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.8,xjust=0,yjust=0)
box()
#figure4
with(dt,plot(Date,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))
dev.off()