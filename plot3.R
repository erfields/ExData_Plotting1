plot3 <- function() { 

    ##read data
    data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                       col.names=c("Date", "Time", "Global_active_power", 
                                   "Global_reactive_power", "Voltage", 
                                   "Global_intensity", "Sub_metering_1", 
                                   "Sub_metering_2", "Sub_metering_3"), 
                       skip = 66636, nrows = 2880, na.strings = "?")
    

    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    png("plot3.png")
    plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", 
         ylab = "Energy sub metering")
    points(data$DateTime, data$Sub_metering_2, type = "l", xlab = "", 
           ylab = "Energy sub metering", col = "red")
    points(data$DateTime, data$Sub_metering_3, type = "l", xlab = "", 
           ylab = "Energy sub metering", col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

    dev.off()
}

## After sourcing file, call plot3() 
## > plot3()