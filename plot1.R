##  Exploratory Data Analysis
##  plot1.R by Greg Zmich
##  Global Active Power Histogram


##  create function
plot1 <- function()
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
hist(data$Global_active_power, 
        col = "red", 
        main = "Global Active Power", 
        xlab = "Global Active Power (kilowatts)")


##  export plot to PNG
dev.copy(png,"plot1.png", height = 480, width = 480)
dev.off()

}
