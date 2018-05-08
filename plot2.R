
EPC <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
names(EPC) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subEPC <- subset(EPC,EPC$Date=="1/2/2007" | EPC$Date =="2/2/2007")

datetime <- strptime(paste(subEPC$Date, subEPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subEPC$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()