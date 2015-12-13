# set the default directory before exeucting the code
# setwd()

# Read ithe sourceData

# comment the below line if you did already  read the sourceData 
sourceData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings=c("?"))

# Below we only need sourceData from two days

# comment the below line if you did already  read the sourceData 
subData <- sourceData[sourceData$Date == "1/2/2007" | sourceData$Date == "2/2/2007", ]

# Combine date and time in a column called datetime
subData$datetime <- mapply(function(s1, s2){as.POSIXct(paste(s1, s2), format = "%d/%m/%Y %H:%M:%S")}, subData$Date,subData$Time)

# Set the heigh and length, the PNG decoder to read a PNG image from r and returns it as an image
png("plot2.png",  width = 480, height = 480, units = "px")

#plot
plot(subData$datetime, subData$Global_active_power, type="l", xaxt = "n", ylab = "Global Active Power (kilowatts)", xlab = "")

# Set to first axis and set the date origin 
axis.POSIXct(1, as.POSIXct(subData$datetime, origin="1970-01-01"))

# shutdown the current device
dev.off()