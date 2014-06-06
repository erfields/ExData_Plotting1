plot1 <- function() { 

    ##read data
    data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                       col.names=c("Date", "Time", "Global_active_power", 
                                   "Global_reactive_power", "Voltage", 
                                   "Global_intensity", "Sub_metering_1", 
                                   "Sub_metering_2", "Sub_metering_3"), 
                       skip = 66636, nrows = 2880, na.strings = "?")
    
    
    ##plot histogram in plot1.png file
    png("plot1.png")
    hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", 
         main="Global Active Power", col="red")
    dev.off()

}

## After sourcing file, call plot1() 
## > plot1()