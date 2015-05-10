##Reading the data
hpc <- read.table("household_power_consumption.txt", sep=";", 
                  header=TRUE, na.string="?")
##"Date" class
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
##Subsetting
hpc2 <- hpc[(hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02"), ]
##"Time" class
hpc2$Time <- strptime(paste(hpc2$Date, hpc2$Time), "%Y-%m-%d %H:%M:%S")
##Changing class variables
hpc2$Sub_metering_1 <- as.numeric(as.character(hpc2$Sub_metering_1))
hpc2$Sub_metering_2 <- as.numeric(as.character(hpc2$Sub_metering_2))
hpc2$Sub_metering_3 <- as.numeric(as.character(hpc2$Sub_metering_3))
##Plot3
  plot(hpc2$Time, hpc2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(hpc2$Time, hpc2$Sub_metering_2,col="Red")
  lines(hpc2$Time, hpc2$Sub_metering_3,col="Blue")
  legend("topright", col=c("Black","Red","Blue"), 
         legend=c("Sub_metering_1   ", "Sub_metering_2   ","Sub_metering_3   "), 
         lty=c(1,1), lwd= c(2.5,2.5), cex=.75)
##Generating PNG file
dev.copy(png, file="plot3.png", height=480, width=480, units="px")
dev.off()