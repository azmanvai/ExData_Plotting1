plot1 <- function() {
          ## load package
          library(lubridate)

          ## read text file
          power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
          
          ## change formats to date, time and numerics
          power$Date <- dmy(power$Date)
          power$Time <- hms(power$Time)
          power[,3:9] <- sapply(power[,3:9], as.numeric)
          
          ##subset only 2007-02-01 and 2007-02-02 data
          power_1 <- subset(power, Date=="2007-02-01"| Date=="2007-02-02")
          
          ##add weekday column
          power_1$Weekday <- wday(power_1$Date, label = TRUE)
          

          ## open graphics device and construct plot
          png(filename = "plot1.png",width = 480, height = 480)
          hist(power_1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
          dev.off()
        
          
          
          
}