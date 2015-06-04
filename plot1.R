library(sqldf)
hpData <- read.csv.sql("../household_power_consumption.txt",sql='SELECT * FROM file WHERE Date = "1/2/2007" OR Date = "2/2/2007"',sep=";")
hist(hpData$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
## Copy my plot to a PNG file
dev.copy(png, file = "plot1.png")
## Don't forget to close the PNG device!
dev.off()

