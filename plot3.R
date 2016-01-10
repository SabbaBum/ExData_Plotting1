# This is COMMON Part for all plots
# Note: _SUBSET.csv is made of large .TXT file just for the dates of 1st and 2nd February 2007
#       Script that generates this SUBSET is in the file gen_SUBSET.R
setwd("~/GitHub/ExData_Plotting1")
DT <- read.csv("household_power_consumption_SUBSET.csv")

# Create a new PNG file for the plot
png(file = "plot3.png", width=480, height=480, units="px", bg="white")

# Calculate DateTime variable as joint of Date and Time fields converted to POSIXct
DateTime <- as.POSIXct(strptime(paste(DT$Date,DT$Time), "%d/%m/%Y %H:%M:%S"))

# First, let's plot metering #1, later will add 2 and 3, plus the legend
plot(DateTime, DT$Sub_metering_1,  type = "l", ylab = "Energy sub metering", xlab = NA)
points(DateTime, DT$Sub_metering_2, col="red", type="l")
points(DateTime, DT$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

# Don't forget to close the PNG device!
dev.off()

