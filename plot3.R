library(sqldf)
hpData <- read.csv.sql("../household_power_consumption.txt",sql='SELECT * FROM file WHERE Date = "1/2/2007" OR Date = "2/2/2007"',sep=";")
dtime <- as.POSIXct(paste(hpData$Date, hpData$Time), format="%d/%m/%Y %H:%M:%S")
par(mar=c(3,5.1,2,1))
plot(dtime,hpData$Sub_metering_1,type="l",ylab="Energy sub metering")
lines(dtime,hpData$Sub_metering_2,col="red")
lines(dtime,hpData$Sub_metering_3,col="blue")
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3 "))
## Copy my plot to a PNG file
dev.copy(png, file = "plot3.png")
## Don't forget to close the PNG device!
dev.off()

