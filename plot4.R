library(sqldf)
power <- read.csv.sql("household_power_consumption.txt", sql= "select * from file where Date in ('1/2/2007', '2/2/2007')", header = TRUE, sep = ';')
power$newdate <- with(power, as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
png("Plot4.png")
par(mfrow = c(2,2))
plot(power$newdate, power$Global_active_power, type = "n", ylab = "Global Active Power", xlab = "")
lines(power$newdate, power$Global_active_power)
plot(power$newdate, power$Voltage, type = "n", ylab = "Voltage", xlab = "datetime")
lines(power$newdate, power$Voltage)
plot(power$newdate, power$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(power$newdate, power$Sub_metering_1, col = "black")
lines(power$newdate, power$Sub_metering_2, col = "red")
lines(power$newdate, power$Sub_metering_3, col = "blue")
legend("topright", pch = 20, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8)
plot(power$newdate, power$Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab = "")
lines(power$newdate, power$Global_reactive_power)
dev.off()
