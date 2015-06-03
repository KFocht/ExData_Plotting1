power_dt <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                       stringsAsFactors = FALSE)
power_dt_subset <- subset(power_dt, power_dt$Date == "1/2/2007" |
                              power_dt$Date == "2/2/2007")
power_dt_subset$dateTime <- paste(power_dt_subset$Date, power_dt_subset$Time, sep = " ")

dateTime <- as.POSIXct(power_dt_subset$dateTime, format = "%d/%m/%Y %H:%M:%S")

meter1 <- as.numeric(power_dt_subset$Sub_metering_1)
meter2 <- as.numeric(power_dt_subset$Sub_metering_2)
meter3 <- as.numeric(power_dt_subset$Sub_metering_3)


##Creates png file
png("plot4.png", width = 480, height = 480)

##Creates area for 4 plots
par(mfrow = c(2, 2))

##plots Global Active Power
plot(dateTime, as.numeric(power_dt_subset$Global_active_power), type = "l",
     xlab = "", ylab = "Global Active Power")

##plots Voltage
plot(dateTime, as.numeric(power_dt_subset$Voltage), type = "l",
     xlab = "datetime", ylab = "Voltage")

##plots Energy sub metering
plot(dateTime, meter1, ylim = range(c(meter1, meter2, meter3)),
     type = "l", xlab = "", ylab = "Energy sub metering")
par(new = TRUE)
plot(dateTime, meter2, ylim = range(c(meter1, meter2, meter3)),
     type = "l", axes = FALSE, xlab = "", ylab = "", col = "orange")
par(new = TRUE)
plot(dateTime, meter3, ylim = range(c(meter1, meter2, meter3)),
     type = "l", axes = FALSE, xlab = "", ylab = "", col = "blue")
legend("topright", lty = 1, col = c("black", "orange", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8)

##plots Global Reactive Power
plot(dateTime, as.numeric(power_dt_subset$Global_reactive_power), type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
