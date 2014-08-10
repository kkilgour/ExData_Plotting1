d <- read.csv('household_power_consumption.txt',sep=';',na.strings="?")

#d[,'Time'] <- as.Date(strptime(paste(as.character(d[,'Date'],d[,'Time']), "%Y-%m%d %H:%M:%S")))
#d[,'Time'] <- strptime(d[,'Time'], "%H:%M:%S")

cbind(d, NewColumn="datetime")
datetimes <- paste(d$Date, d$Time)

dts <- as.POSIXct(strptime(datetime, "%d/%m/%Y %H:%M:%S"))
d[,'datetime'] <- dts

d[,'Date'] <- as.Date(d[,'Date'], "%d/%m/%Y")
d <- subset(d, Date==as.Date('2007-2-2') | Date==as.Date('2007-02-01'))

png('plot2.png')
with(d, plot(datetime, Global_active_power, type='l', ylab='GLobal Active Power (kilowatts)', xlab=''))
dev.off()