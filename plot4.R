###############
## plot 4
############$##

# 'filter' dependency 
library(dplyr)

# create data set
dat <- read.table("household_power_consumption.txt", header=TRUE, na.strings = "?", nrows = 2075260, quote = "", sep = ";", strip.white = TRUE, stringsAsFactors = FALSE)

# filter data by date range
d <- filter(dat, Date == "1/2/2007" | Date == "2/2/2007")

# don't need dat anymore.
rm(dat)

# convert Date field of type 'character' to type 'date'
d$Date <- as.Date(d$Date, format = "%d/%m/%Y")

# merge date & time
d$DateTime <- as.POSIXct(paste(d$Date, d$Time))

# create plots and save as png
png("plot4.png", width = 480, height = 480)
par(mar = c(2,4,1,1), mfcol = c(2,2))
plot(d$DateTime, d$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(d$DateTime, d$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(d$DateTime, d$Sub_metering_2, col="red", type = "l")
lines(d$DateTime, d$Sub_metering_3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", col=c("black", "red", "blue"), lty = 1)
plot(d$DateTime, d$Voltage, type = "l", xlab="datetime", ylab="Voltage")
plot(d$DateTime, d$Global_reactive_power, type = "l", xlab = "datetime", ylab="Global_reactive_power")
dev.off() 

# clean up
rm(d)
