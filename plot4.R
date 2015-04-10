##  Exploratory Data Analysis
##  plot4.R by Greg Zmich

##  4 plots at once
        ##  Global Active Power (plot 2)
        ##  Voltage (new)
        ##  Energy Sub Metering (plot 3)
        ##  Global Reactive Power (new)


##  create function
plot4 <- function()
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
        

##  set number of graphs and related parameters
par( mfrow = c( 2, 2 ) )
cex = .7


##  graph 1 - Global Active Power (plot 2) 
plot(data$Date.Time, data$Global_active_power,
     type = "l",
     cex.lab = .7,
     cex.axis = .7,
     xlab = "",
     ylab = "Global Active Power")


##  graph 2 - Voltage (new)
plot(data$Date.Time, data$Voltage,
     type = "l",
     cex.lab = .7,
     cex.axis = .7,
     xlab = "datetime",
     ylab = "Voltage")


##  graph 3 - Energy Sub Metering (plot 3)
plot(data$Date.Time, data$Sub_metering_1,
     type = "l",
     cex.lab = .7,
     cex.axis = .7,
     xlab = "",
     ylab = "Energy sub metering")

points(data$Date.Time, data$Sub_metering_2, col = 2, type = "l")
points(data$Date.Time, data$Sub_metering_3, col = 4, type = "l")

legend("topright",  
       c("Sub_metering_1",
         "Sub_metering_2",
         "Sub_metering_3"),
       bty = "n",
       xjust = 1,
       text.width = strwidth("Sub_metering_1"),
       cex = .6,
       lty = 1,
       col = c(1, 2, 4))


##  graph 4 - Global Reactive Power (new)
plot(data$Date.Time, data$Global_reactive_power,
     type = "l",
     cex.lab = .7,
     cex.axis = .7,
     xlab = "datatime",
     ylab = "Global_reactive_power")

## axis(2, at = seq(0.0, 0.5, by = .1))
        

##  export plot to PNG
dev.copy(png, "plot4.png", height = 480, width = 480)
dev.off()

}
