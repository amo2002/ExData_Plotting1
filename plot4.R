# Download the  Electric power consumption data

# set the default directory before exeucting the code
# setwd()

# Read in all the sourceData
sourceData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings=c("?"))

# Below we only need sourceData from two days
subData <- sourceData[sourceData$Date == "1/2/2007" | sourceData$Date == "2/2/2007", ]

# Create a new column with the combined date and time
subData$datetime <- mapply(function(s1, s2){as.POSIXct(paste(s1, s2), format = "%d/%m/%Y %H:%M:%S")}, subData$Date,subData$Time)

# Set the heigh and length, the PNG decoder to read a PNG image from r and returns it as an image
png("plot4.png",  width = 480, height = 480, units = "px")

# set the query graphical parameters
par(mfrow = c(2,2))

# Plot 1: Top-left
plot(subData$datetime, subData$Global_active_power, type="l", xaxt = "n", ylab = "Global Active Power", xlab = "")

# Set the first axis and set the date origin
axis.POSIXct(1, as.POSIXct(subData$datetime, origin="1970-01-01"))

# Plot 2 : Bottom-left
plot(subData$datetime, subData$Voltage, type="l", xaxt = "n", ylab = "Voltage", xlab = "datetime")

# Set the first axis and set the date origin
axis.POSIXct(1, as.POSIXct(subData$datetime, origin="1970-01-01"))

# Plot 3 : Bottom-left
plot(subData$datetime, subData$Sub_metering_1, type="l", xaxt = "n", ylab = "Energy sub metering", xlab = "")

# Add connected lines 
lines(subData$datetime, subData$Sub_metering_2, col = "red")
lines(subData$datetime, subData$Sub_metering_3, col = "blue")

# Set the first axis and set the date origin
axis.POSIXct(1, as.POSIXct(subData$datetime, origin="1970-01-01"))

# Remove the border of legend here
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

# Plot 4: Bottom-right
plot(subData$datetime, subData$Global_reactive_power, type="l", xaxt = "n", ylab = "Global_reactive_power", xlab = "datetime")

# Set to first axis and set the date origin
axis.POSIXct(1, as.POSIXct(subData$datetime, origin="1970-01-01"))

# shutdown the current device
dev.off()