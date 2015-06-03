##Reads table
power_dt <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                       stringsAsFactors = FALSE)

##Creates subset of needed dates
power_dt_subset <- subset(power_dt, power_dt$Date == "1/2/2007" |
                              power_dt$Date == "2/2/2007")

##Creates png file
png("plot1.png", width = 480, height = 480)

##Creates histogram
hist(as.numeric(power_dt_subset$Global_active_power), col = "orange",
     xlab = "Global Active Power(kilowatts)", main = "Global Active Power")

dev.off()