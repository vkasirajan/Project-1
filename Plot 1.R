# Clean up a little bit and set working directory.
rm(list = ls())
setwd("C:/Data Science/04 - Exploratory Data Analysis/Project - 1/Project-1/")

# Now read the input data and strip off the data in the required range
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
df1 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

# Convert the required field for Plot 1 into numeric
gap <- as.numeric(df1$Global_active_power)

# Setup the output file, plot the histogram and turn off the output file
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(gap, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()