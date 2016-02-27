## Below funtion  produces plot4.png

## read table
HPC_all<-read.table("household_power_consumption.txt", header = T, sep = ";")
## read subset of the data
HPC_sub2days <- subset(HPC_all, Date == "1/2/2007"| Date == "2/2/2007")
HPC_sub2days$Date<-paste(HPC_sub2days$Date,HPC_sub2days$Time)
## conver time to POSIXlt class
HPC_sub2days$Date <- strptime(HPC_sub2days$Date, "%d/%m/%Y %H:%M:%S")
HPC_sub2days$Time<- NULL

## conver factor to numeric
indx<-sapply(HPC_sub2days,is.factor)
HPC_sub2days[indx]<-sapply(HPC_sub2days[indx], function(x) as.numeric(as.character(x)))

png("plot4.png",  width = 480, height = 480, units = "px")
par(mfrow=c(2,2))

#plot Global_active_power vs Date
plot(HPC_sub2days$Date, HPC_sub2days$Global_active_power,type = "n", xlab= "", ylab = "Global Active Power" ,cex.axis=0.9)
lines(HPC_sub2days$Date, HPC_sub2days$Global_active_power)

#plot Voltage vs Date
plot(HPC_sub2days$Date, HPC_sub2days$Voltage,type = "n", xlab= "datetime", ylab = "Voltage" ,cex.axis=0.9)
lines(HPC_sub2days$Date, HPC_sub2days$Voltage)

#plot Sub_metering_1,Sub_metering_2,Sub_metering_3 vs Date
plot(HPC_sub2days$Date, HPC_sub2days$Sub_metering_2,ylim=c(0,38), type = "n", axes = F, xlab= "", ylab = "Energy sub metering", cex.axis=0.9)
axis(side = 2, at = seq(0,30,by=10))
box()
r <- as.POSIXct(round(range(HPC_sub2days$Date), "hours"))
axis.POSIXct(1, at = seq(r[1], r[2], by = "day"), format = "%a")
lines(HPC_sub2days$Date,HPC_sub2days$Sub_metering_1)
lines(HPC_sub2days$Date,HPC_sub2days$Sub_metering_2,col="red")
lines(HPC_sub2days$Date,HPC_sub2days$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),bty ="n",legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"))

#plot Global_reactive_power vs Date
plot(HPC_sub2days$Date, HPC_sub2days$Global_reactive_power,type = "n", xlab= "datetime", cex.axis=0.9, ylab = "Global_reactive_power" )
lines(HPC_sub2days$Date, HPC_sub2days$Global_reactive_power)

dev.off()