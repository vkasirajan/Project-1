# Clean up a little bit and set working directory.
rm(list = ls())
setwd("C:/Data Science/04 - Exploratory Data Analysis/Project-1/Project-1/")

# Now read the input data and strip off the data in the required range
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
df1 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

# Perform some conversions
dt <- strptime(paste(df1$Date, df1$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(df1$Global_active_power)
subMeter1 <- as.numeric(df1$Sub_metering_1)
subMeter2 <- as.numeric(df1$Sub_metering_2)
subMeter3 <- as.numeric(df1$Sub_metering_3)
grp <- as.numeric(df1$Global_reactive_power)
voltage <- as.numeric(df1$Voltage)

# Start the plot now. It is a 2 X 2 Plot!
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))


# Plot the first graph
plot(dt, gap, type="l", ylab="Global Active Power", cex=0.2)

# Plot the second graph
plot(dt, voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot the third graph
plot(dt, subMeter1, type="l", ylab="Energy Submetering")
lines(dt, subMeter2, col = "red",  type = "l")
lines(dt, subMeter3, col = "blue",  type = "l")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = , lwd = 3, bty = "o")

# Plot the fourth graph
plot(dt, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()