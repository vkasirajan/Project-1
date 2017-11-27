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

# Plot the graoh now
png("plot3.png", width = 480, height = 480, units = "px")
plot(dt, subMeter1, type = "l", ylab = "Energy Submetering")

# The remaining sub meters can be added as a line
lines(dt, subMeter2, col = "red",  type = "l")
lines(dt, subMeter3, col = "blue", type = "l")

# Now add the legend
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 3)
dev.off()