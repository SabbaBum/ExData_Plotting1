# We have a big file - will use fread and %like%, so we need data.table!
require(data.table)

# Let's do all work in the correct directory !
setwd("~/GitHub/ExData_Plotting1")

# download the ZIP
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile="household_power_consumption.zip")

# get the TXT out of it
unzip("household_power_consumption.zip")

# read the file and make sure we've got it right
DT <- fread("household_power_consumption.txt",
            na.strings = "?",
            stringsAsFactors = FALSE,
            colClasses=c("character","character","numeric",
                         "numeric","numeric","numeric",
                         "integer","integer","integer"))

# write only needed data from data table to the CSV file for further use
write.csv(DT[((Date %like% "^1/2/2007") | (Date %like% "^2/2/2007"))],
          file="household_power_consumption_SUBSET.csv", row.names=FALSE)

# cleanup
rm(DT)
