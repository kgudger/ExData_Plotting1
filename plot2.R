library(sqldf)
hpData <- read.csv.sql("../household_power_consumption.txt",sql='SELECT * FROM file WHERE Date = "1/2/2007" OR Date = "2/2/2007"',sep=";")
dtime <- as.POSIXct(paste(hpData$Date, hpData$Time), format="%d/%m/%Y %H:%M:%S")
par(mar=c(3,5.1,2,1))
plot(dtime,hpData$Global_active_power,type="l",ylab="Global Active Power (kilowatts)")
## Copy my plot to a PNG file
dev.copy(png, file = "plot2.png")
## Don't forget to close the PNG device!
dev.off()

