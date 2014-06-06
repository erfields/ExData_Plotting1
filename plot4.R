plot4 <- function() { 
    
    ##read data
    data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                       col.names=c("Date", "Time", "Global_active_power", 
                                   "Global_reactive_power", "Voltage", 
                                   "Global_intensity", "Sub_metering_1", 
                                   "Sub_metering_2", "Sub_metering_3"), 
                       skip = 66636, nrows = 2880, na.strings = "?")
    
    ##concat Date and Time fields and format
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    
    ##plot data in plot4.png
    png("plot4.png")
    par(mfrow = c(2, 2))
      
    ##top left plot
    plot(data$DateTime, data$Global_active_power, type = "l", 
         ylab = "Global Active Power", 
         xlab = "")
    
    ##top right plot
    plot(data$DateTime, data$Voltage, type = "l", ylab = "Voltage", 
         xlab = "datetime")
    
    ##bottom left plot
    plot(data$DateTime, data$Sub_metering_1, type = "l", 
         ylab = "Energy sub metering", 
         xlab = "", col = "black")
    points(data$DateTime, data$Sub_metering_2, type = "l", xlab = "", 
           ylab = "Sub_metering_2", 
           col = "red")
    points(data$DateTime, data$Sub_metering_3, type = "l", xlab = "", 
           ylab = "Sub_metering_3", 
           col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           bty = "n", )
    
    ##bottom right plot
    plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", 
         ylab = "Global_reactive_power", ylim = c(0, 0.5))
    
    dev.off()

}

## After sourcing file, call plot4() 
## > plot4()