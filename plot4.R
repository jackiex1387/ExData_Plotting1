data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", 
                   skip = 66637, nrows=2880)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
                    "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" )

DateTime <- paste(data$Date, data$Time)
data$Time <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", width = 480, height = 480, bg = "transparent")

par(mfrow = c(2,2))
plot(data$Time, data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
plot(data$Time, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data$Time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
plot(data$Time, data$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()
