plot2 <- function() { 
    
    ##read data
    data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                       col.names=c("Date", "Time", "Global_active_power", 
                                   "Global_reactive_power", "Voltage", 
                                   "Global_intensity", "Sub_metering_1", 
                                   "Sub_metering_2", "Sub_metering_3"), 
                                    skip = 66636, nrows = 2880, na.strings = "?")
    
    ##concat Date and Time fields and format
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    
    ##plot data in plot2.png
    png("plot2.png")
    plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", 
         ylab = "Global Active Power (kilowatts)")
    dev.off()
    
}

## After sourcing file, call plot2() 
## > plot2()