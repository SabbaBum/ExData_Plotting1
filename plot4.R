# This is COMMON Part for all plots
# Note: _SUBSET.csv is made of large .TXT file just for the dates of 1st and 2nd February 2007
#       Script that generates this SUBSET is in the file gen_SUBSET.R
setwd("~/GitHub/ExData_Plotting1")
DT <- read.csv("household_power_consumption_SUBSET.csv")

# Create a new PNG file for the plot
png(file = "plot4.png", width=480, height=480, units="px", bg="white")

# Calculate DateTime variable as joint of Date and Time fields converted to POSIXct
DateTime <- as.POSIXct(strptime(paste(DT$Date,DT$Time), "%d/%m/%Y %H:%M:%S"))

# Plot4 - plot 4 plots :)
# Let's configure parameters with ROW order
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

# First two are easy, like plot#2
plot(DateTime, DT$Global_active_power, type = "l",
    ylab = "Global Active Power", xlab = NA)
plot(DateTime, DT$Voltage, type = "l",
     ylab = "Voltage", xlab = "datetime")

# Third is actually a version of plot#3, but without a box around the legend
plot(DateTime, DT$Sub_metering_1,  type = "l",
     ylab = "Energy sub metering", xlab = NA)
points(DateTime, DT$Sub_metering_2, col="red", type="l")
points(DateTime, DT$Sub_metering_3, col="blue", type="l")
# No box, so put bty="n"
legend("topright", lwd=1, bty="n",
       col = c("black", "blue", "red"),
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

# Fourth is same as the first and second, the easy guys :)
plot(DateTime, DT$Global_reactive_power, type = "l",
     ylab = "global_reactive_power", xlab = "datetime")

# Don't forget to close the PNG device!
dev.off()

