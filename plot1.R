##Reading the data
hpc <- read.table("household_power_consumption.txt", sep=";", 
                  header=TRUE, na.string="?")
##"Date" class
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
##Subsetting
hpc2 <- hpc[(hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02"), ]
##Plot 1
hist(hpc2$Global_active_power, main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", ylab= "Frequency", col="Red")
##Generating PNG file
dev.copy(png, file="plot1.png", height=480, width=480, units="px")
dev.off()
