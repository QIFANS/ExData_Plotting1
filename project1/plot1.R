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
png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(dt$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()