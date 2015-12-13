# Download the  Electric power consumption data

# set the default directory before exeucting the code
# setwd("C:/Users/...")

# Read the sourceData
sourceData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings=c("?"))

# Two days sourceData for February 1, 2007 and February 1, 2007
subData <- sourceData[sourceData$Date == "1/2/2007" | sourceData$Date == "2/2/2007", ]

# Set the heigh and length, the PNG decoder to read a PNG image from r and returns it as an image
png("plot1.png",  width = 480, height = 480, units = "px")

# Histograms, set x and y title  and the main title and target Global active power attribute
hist(subData$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

# shutdown the current device
dev.off()
