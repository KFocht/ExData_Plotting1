##Reads table
power_dt <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                       stringsAsFactors = FALSE)

##Creates subset of needed dates
power_dt_subset <- subset(power_dt, power_dt$Date == "1/2/2007" |
                              power_dt$Date == "2/2/2007")

##Adds a column to combine date and time and then converts to POSIXct
power_dt_subset$dateTime <- paste(power_dt_subset$Date, power_dt_subset$Time, sep = " ")
dateTime <- as.POSIXct(power_dt_subset$dateTime, format = "%d/%m/%Y %H:%M:%S")

##Creates png file
png("plot2.png", width = 480, height = 480)

##Creates line graph
plot(dateTime, as.numeric(power_dt_subset$Global_active_power), type = "l",
     xlab = " ", ylab = "Global Active Power (kilowatts)")

dev.off()

