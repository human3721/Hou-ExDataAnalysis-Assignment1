## Below funtion  produces plot2.png

## read table
HPC_all<-read.table("household_power_consumption.txt", header = T, sep = ";")

## read subset of the data
HPC_sub2days <- subset(HPC_all, Date == "1/2/2007"| Date == "2/2/2007")
HPC_sub2days$Date<-paste(HPC_sub2days$Date,HPC_sub2days$Time)
HPC_sub2days$Time<- NULL
HPC_sub2days$Global_active_power<-as.numeric(as.character(HPC_sub2days$Global_active_power))

## conver time to POSIXlt class
HPC_sub2days$Date <- strptime(HPC_sub2days$Date, "%d/%m/%Y %H:%M:%S")

png("plot2.png",  width = 480, height = 480, units = "px")

#plot Global_active_power vs Date
plot(HPC_sub2days$Date, HPC_sub2days$Global_active_power,type = "n", xlab= "", ylab = "Global Active Power (kilowatts)" )
lines(HPC_sub2days$Date, HPC_sub2days$Global_active_power)
dev.off()