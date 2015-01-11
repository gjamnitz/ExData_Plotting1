
# reading file - only necessary rows read
powerConsumption <- read.csv(file = "household_power_consumption.txt", sep = ";", header = FALSE, skip = 66637, nrows = 69518 - 66637 - 1)
names(powerConsumption) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# setting date values
powerConsumption$Date <- strptime(paste(powerConsumption$Date, powerConsumption$Time), "%d/%m/%Y %H:%M:%S")

# selecting graphics device
png("plot2.png", width = 480, height = 480)

#drawing graph
par(mfrow = c(1, 1))
with(powerConsumption, plot(Date, Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)"))

# closing device
dev.off()
