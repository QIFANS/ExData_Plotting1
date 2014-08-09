Sys.setlocale("LC_TIME", "American")
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
dt<-dt[grep("^[12]/2/2007$",dt$Date),]
dt<-data.frame(Date=as.POSIXct(strptime(paste(dt$Date,dt$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")),dt[,c(-1,-2)])
#plot
png(filename = "plot2.png",width = 480, height = 480, units = "px")
with(dt,plot(Date,Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)"))
dev.off()