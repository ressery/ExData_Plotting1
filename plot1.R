###############
## plot 1
############$##

# 'filter' dependency
library(dplyr)

# create data set
dat <- read.table("household_power_consumption.txt",header=TRUE, na.strings= "?", nrows = 2075260, quote= "", sep=";", strip.white=TRUE, stringsAsFactors = FALSE)

# filter data by date range
d <- filter(dat, Date == "1/2/2007" | Date == "2/2/2007")

# don't need dat anymore.
rm(dat)

# convert Date field of type 'character' to type 'date'
d$Date <- as.Date(d$Date, format = "%d/%m/%Y")

# create plot and save as png
png("plot1.png", width = 480, height = 480)
hist(d$Global_active_power, breaks= 12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab= "Frequency")
dev.off()

# clean up
rm(d)

