plot2 <- function() {
          ## load package
          library(lubridate)
 
          ## read text file
          power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
          
          ## add Datetime column, change formats to date, time and numerics
          power$Datetime <- paste(power$Date, power$Time)
          power$Datetime <- dmy_hms(power$Datetime)
          power[,3:9] <- sapply(power[,3:9], as.numeric)
          
          
          ##subset only 2007-02-01 and 2007-02-02 data
          power1 <- subset(power, date(Datetime) =="2007-02-01"| date(Datetime) =="2007-02-02",)
          
         
          ## open graphics device and construct plot
          png(filename = "plot2.png",width = 480, height = 480)
          x <- power1$Datetime
          y <- power1$Global_active_power
          plot(x,y, xlab = "", ylab = "Global Active Power(kilowatts)",  type = "l")
          dev.off()
 
}