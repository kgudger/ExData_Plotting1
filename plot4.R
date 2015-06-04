library(sqldf)
hpData <- read.csv.sql("../household_power_consumption.txt",sql='SELECT * FROM file WHERE Date = "1/2/2007" OR Date = "2/2/2007"',sep=";")
datetime <- as.POSIXct(paste(hpData$Date, hpData$Time), format="%d/%m/%Y %H:%M:%S")
par(mfrow = c(2, 2) , mar=c(5.1,5.1,2,1))
plot(datetime,hpData$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(datetime,hpData$Voltage,type="l",ylab="Voltage")
plot(datetime,hpData$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(datetime,hpData$Sub_metering_2,col="red")
lines(datetime,hpData$Sub_metering_3,col="blue")
legend("topright", cex=0.75, bty="n", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3 "))
plot(datetime,hpData$Global_reactive_power,type="l",ylab="Global_reactive_power")
## Copy my plot to a PNG file
dev.copy(png, file = "plot4.png")
## Don't forget to close the PNG device!
dev.off()

