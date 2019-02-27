Sys.setlocale('LC_TIME',"C")

house<-read.table('household_power_consumption.txt',header=T,sep=';',na.strings = '?')
house.n<-subset(house,Date=='1/2/2007'|Date=='2/2/2007')
house.n$Tempo<-strptime(paste(house.n$Date,house.n$Time,sep=' '),'%d/%m/%Y %H:%M:%S')

#Plot 2
plot(house.n$Tempo,house.n$Global_active_power,type='l',xlab='',ylab='Global Active Power (kilowatts)')
dev.copy(png,file='plot2.png')
dev.off()
