
# reading file - only necessary rows read
powerConsumption <- read.csv(file = "household_power_consumption.txt", sep = ";", header = FALSE, skip = 66637, nrows = 69518 - 66637 - 1)
names(powerConsumption) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
powerConsumption$Date <- strptime(paste(powerConsumption$Date, powerConsumption$Time), "%d/%m/%Y %H:%M:%S")

# selecting graphics device
png("plot4.png", width = 480, height = 480)

#drawing graph
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

with(powerConsumption, plot(Date, Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)"))

with(powerConsumption, plot(Date, Voltage, type="l", xlab="datetime", ylab = "Voltage"))

with(powerConsumption, plot(Date, Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering"))
with(powerConsumption, points(Date, Sub_metering_2, type="l", col="red"))
with(powerConsumption, points(Date, Sub_metering_3, type="l", col="blue"))
legend("topright", lty = 1, bty = "n", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(powerConsumption, plot(Date, Global_reactive_power, type="l", xlab="datetime"))

# closing device
dev.off()