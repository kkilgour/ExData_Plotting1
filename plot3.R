d <- read.csv('household_power_consumption.txt',sep=';',na.strings="?")

#d[,'Time'] <- as.Date(strptime(paste(as.character(d[,'Date'],d[,'Time']), "%Y-%m%d %H:%M:%S")))
#d[,'Time'] <- strptime(d[,'Time'], "%H:%M:%S")

cbind(d, NewColumn="datetime")
datetimes <- paste(d$Date, d$Time)

dts <- as.POSIXct(strptime(datetime, "%d/%m/%Y %H:%M:%S"))
d[,'datetime'] <- dts

d[,'Date'] <- as.Date(d[,'Date'], "%d/%m/%Y")
d <- subset(d, Date==as.Date('2007-2-2') | Date==as.Date('2007-02-01'))

#png('plot3.png')
#plot.ts(d[,'datetime'], y=d[,'Global_active_power'], type='l', ylab='Global Active Power (kilowatts)', xlab='')
plot.ts(c(d[,'datetime'],d[,'datetime'],d[,'datetime']), y=c(d[,'Sub_metering_1'],d[,'Sub_metering_2'],d[,'Sub_metering_3']), plot.type = 'multiple', type='l', ylab='Energy Sub Metering', xlab='', col=c('BLACK', 'BLUE', 'RED'))
#dev.off()