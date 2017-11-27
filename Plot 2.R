# Clean up a little bit and set working directory.
rm(list = ls())
setwd("C:/Data Science/04 - Exploratory Data Analysis/Project-1/Project-1/")

# Now read the input data and strip off the data in the required range
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
df1 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

# Perform some conversions
dt <- strptime(paste(df1$Date, df1$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(df1$Global_active_power)

# Plot the graph now
png("plot2.png", width = 480, height = 480, units = "px")
plot(dt, gap, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()