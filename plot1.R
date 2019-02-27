Sys.setlocale('LC_TIME',"C")

house<-read.table('household_power_consumption.txt',header=T,sep=';',na.strings = '?')
house.n<-subset(house,Date=='1/2/2007'|Date=='2/2/2007')
house.n$Tempo<-strptime(paste(house.n$Date,house.n$Time,sep=' '),'%d/%m/%Y %H:%M:%S')

#Plot 1
hist(house.n$Global_active_power,col='red',main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.copy(png,file='plot1.png')
dev.off()
