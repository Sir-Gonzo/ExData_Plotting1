# read file and using data from dates 2007-02-01 and 2007-02-02
dataFile <- "./DATA/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
power <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

#create variables
datetime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(power$Global_active_power)
globalReactivePower <- as.numeric(power$Global_reactive_power)
voltage <- as.numeric(power$Voltage)
subMetering1 <- as.numeric(power$Sub_metering_1)
subMetering2 <- as.numeric(power$Sub_metering_2)
subMetering3 <- as.numeric(power$Sub_metering_3)

#create plot4.png and plot graphic
png("./datasciencecoursera/Exploratory Data Analysis/Course Project 1/plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()