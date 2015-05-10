##Reading the data
hpc <- read.table("household_power_consumption.txt", sep=";", 
                  header=TRUE, na.string="?")
##"Date" class
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
##Subsetting
hpc2 <- hpc[(hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02"), ]
##"Time" class
hpc2$Time <- strptime(paste(hpc2$Date, hpc2$Time), "%Y-%m-%d %H:%M:%S")
##Plot2
plot(hpc2$Time,hpc2$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
##Generating PNG file
dev.copy(png, file="plot2.png", height=480, width=480, units="px")
dev.off()