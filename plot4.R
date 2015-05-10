##Reading the data
hpc <- read.table("household_power_consumption.txt", sep=";", 
                  header=TRUE, na.string="?")
##"Date" class
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
##Subsetting
hpc2 <- hpc[(hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02"), ]
##"Time" class
hpc2$Time <- strptime(paste(hpc2$Date, hpc2$Time), "%Y-%m-%d %H:%M:%S")
##Plot 4
par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(hpc2$Time, hpc2$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(hpc2$Time, hpc2$Voltage,type="l", xlab="daytime", ylab="Voltage")
plot(hpc2$Time, hpc2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpc2$Time, hpc2$Sub_metering_2,col="Red")
lines(hpc2$Time, hpc2$Sub_metering_3,col="Blue")
legend("topright", col=c("Black","Red","Blue"), 
       legend=c("Sub_metering_1    ", "Sub_metering_2    ","Sub_metering_3    "),
       lty=c(1,1), bty="n", cex=.5)
plot(hpc2$Time, hpc2$Global_reactive_power,type="l", 
     xlab="daytime", ylab="Global_reactive_power")
##Generating PNG file
dev.copy(png, file="plot4.png", height=480, width=480, units="px")
dev.off()