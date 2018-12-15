
# read file and using data from dates 2007-02-01 and 2007-02-02
dataFile <- "./DATA/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
power <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")
#subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#create variables
globalActivePower <- as.numeric(power$Global_active_power)

#create plot1.png and plot graphic
png("./datasciencecoursera/Exploratory Data Analysis/Course Project 1/plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()