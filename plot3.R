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
png("plot3.png", width = 480, height = 480)

##plots sub_metering_1
plot(dateTime, meter1, ylim = range(c(meter1, meter2, meter3)),
     type = "l", xlab = "", ylab = "Energy sub metering")

##plots sub_metering_2 on same graph
par(new = TRUE)
plot(dateTime, meter2, ylim = range(c(meter1, meter2, meter3)),
     type = "l", axes = FALSE, xlab = "", ylab = "", col = "orange")

##plots sub_metering_3 on same graph
par(new = TRUE)
plot(dateTime, meter3, ylim = range(c(meter1, meter2, meter3)),
     type = "l", axes = FALSE, xlab = "", ylab = "", col = "blue")

##creates legend
legend("topright", lty = 1, col = c("black", "orange", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()