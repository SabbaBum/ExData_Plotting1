# This is COMMON Part for all plots
# Note: _SUBSET.csv is made of large .TXT file just for the dates of 1st and 2nd February 2007
#       Script that generates this SUBSET is in the file gen_SUBSET.R
setwd("~/GitHub/ExData_Plotting1")
DT <- read.csv("household_power_consumption_SUBSET.csv")

# Create a new PNG file for the plot
png(file = "plot1.png", width=480, height=480, units="px", bg="white")

# This is the easiest one, and we can pass all params in one call
hist(DT$Global_active_power,
     col="red",
     main = "Global Active Power",
     xlab="Global Active Power (kilowatts)")

# Don't forget to close the PNG device!
dev.off()
