d <- read.csv('household_power_consumption.txt',sep=';',na.strings="?")
d[,'Date'] <- as.Date(d[,'Date'], "%d/%m/%Y")
d <- subset(d, Date==as.Date('2007-2-2') | Date==as.Date('2007-02-01'))

png('plot2.png')
hist(d[,'Global_active_power'], col="RED", main="Global Active Power", xlab="Global Active Power (kilowatts)", plot=TRUE)
dev.off()