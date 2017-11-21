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
          png(filename = "plot3.png",width = 480, height = 480)
          x <- power1$Datetime
          y1 <- power1$Sub_metering_1
          y2 <- power1$Sub_metering_2
          y3 <- power1$Sub_metering_3
          plot(x,y1, xlab = "", ylab = "",  type = "l", ylim = c(0,40))
          par(new=TRUE)
          plot(x,y2, xlab = "", ylab = "",  type = "l", ylim = c(0,40), col = "red")
          par(new = TRUE)
          plot(x,y3, xlab = "", ylab = "Energy sub metering", type = "l", ylim = c(0,40), col = "blue")
          legend("topright", pch = "____", col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
          dev.off()
          
}