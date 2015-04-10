##  Exploratory Data Analysis
##  plot3.R by Greg Zmich
##  Energy Sub Metering


##  create function
plot3 <- function()
{
        
##  set directory
setwd("/Users/zmich/Desktop/Coursera/03 Exploratory Data Analysis/WD1")
        
        
##  read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",  na.strings = "?")
        
        
##  make Date.Time from Date and Time
data$Date.Time <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
        
        
##  reduce data set to appropriate date range and eliminate NA
data <- data[data$Date.Time >= "2007/02/01"  &  data$Date.Time < "2007/02/03",]
data <- na.omit(data)
        
        
##  plot data to screen
        plot(data$Date.Time, data$Sub_metering_1,
             type = "l",
             xlab = "",
             ylab = "Energy sub metering")
        
        points(data$Date.Time, data$Sub_metering_2, col = 2, type = "l")
        points(data$Date.Time, data$Sub_metering_3, col = 4, type = "l")

        legend("topright",  
                c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"),
                xjust = 1,
                text.width = strwidth("Sub_metering_1"),
                cex = .6,
                lty = 1,
                col = c(1, 2, 4))
        
        
##  export plot to PNG
dev.copy(png,"plot3.png", height = 480, width = 480)
dev.off()

}
