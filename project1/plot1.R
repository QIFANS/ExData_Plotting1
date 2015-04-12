#import data into Rstudio
file<-unzip("exdata-data-household_power_consumption.zip")
dt<-read.table(file,header=T,sep=";",as.is=F,na.strings=c("",NA,"?"))
dt<-dt[grep("^[1|2]/2/2007$",dt$Date),]
dt<-data.frame(Date=as.POSIXct(strptime(paste(dt$Date,dt$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")),dt[,c(-1,-2)])


#plot
png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(dt$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()