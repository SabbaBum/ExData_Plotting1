# This is COMMON Part for all plots
# Note: _SUBSET.csv is made of large .TXT file just for the dates of 1st and 2nd February 2007
#       Script that generates this SUBSET is in the file gen_SUBSET.R
setwd("~/GitHub/ExData_Plotting1")
DT <- read.csv("household_power_consumption_SUBSET.csv")

# Create a new PNG file for the plot
png(file = "plot2.png", width=480, height=480, units="px", bg="white")

# Calculate DateTime variable as joint of Date and Time fields converted to POSIXct
DateTime <- as.POSIXct(strptime(paste(DT$Date,DT$Time), "%d/%m/%Y %H:%M:%S"))

# This plot is also easy, implementing in one call
plot(DateTime, DT$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = NA)

# Don't forget to close the PNG device!
dev.off()

