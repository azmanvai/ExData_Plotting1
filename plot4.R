plot4 <- function() {
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
          
          
          ## open graphics device and construct plots
          png(filename = "plot4.png",width = 480, height = 480)
          par(mfcol = c(2,2))
          
          ## plot global active power
          x <- power1$Datetime
          y <- power1$Global_active_power
          plot(x,y, xlab = "", ylab = "Global Active Power(kilowatts)",  type = "l")
          
          ## plot energy sub metering
          y1 <- power1$Sub_metering_1
          y2 <- power1$Sub_metering_2
          y3 <- power1$Sub_metering_3
          plot(x,y1, xlab = "", ylab = "",  type = "l", ylim = c(0,40))
          par(new=TRUE)
          plot(x,y2, xlab = "", ylab = "",  type = "l", ylim = c(0,40), col = "red")
          par(new = TRUE)
          plot(x,y3, xlab = "", ylab = "Energy sub metering", type = "l", ylim = c(0,40), col = "blue")
          legend("topright", pch = "____", col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

          ## plot voltage
          v <- power1$Voltage
          plot(x,v, xlab= "datetime",ylab = "Voltage", type = "l")
          
          ## plot global reactive power
          z <- power1$Global_reactive_power
          plot(x,z, xlab = "datetime",ylab = "Global reactive power", type = "l")
          
          dev.off()
          
}
