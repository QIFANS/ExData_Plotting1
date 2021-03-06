#import data into Rstudio
file<-unzip("exdata-data-household_power_consumption.zip")
dt<-read.table(file,header=T,sep=";",as.is=F,na.strings=c("",NA,"?"))
dt<-dt[grep("^[1|2]/2/2007$",dt$Date),]
dt<-data.frame(Date=as.POSIXct(strptime(paste(dt$Date,dt$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")),dt[,c(-1,-2)])

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