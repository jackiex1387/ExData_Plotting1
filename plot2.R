data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", 
                   skip = 66637, nrows=2880)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
                    "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" )

DateTime <- paste(data$Date, data$Time)
data$Time <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", width = 480, height = 480, bg = "transparent")

par(mfrow = c(1,1))
plot(data$Time, data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()

