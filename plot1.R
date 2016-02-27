## Below funtion  produces plot1.png

## read table
HPC_all<-read.table("household_power_consumption.txt", header = T, sep = ";")

## read subset of the data
HPC_sub2days <- subset(HPC_all, Date == "1/2/2007"| Date == "2/2/2007")
HPC_sub2days$Date<-paste(HPC_sub2days$Date,HPC_sub2days$Time)
HPC_sub2days$Time<- NULL
## conver Global_active_power to numeric vector
HPC_sub2days$Global_active_power<-as.numeric(as.character(HPC_sub2days$Global_active_power))

png("plot1.png",  width = 480, height = 480, units = "px")
## Produce histogram using Global_active_power data
hist(HPC_sub2days$Global_active_power,breaks=12, main= "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()