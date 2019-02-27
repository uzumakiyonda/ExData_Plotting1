Sys.setlocale('LC_TIME',"C")

house<-read.table('household_power_consumption.txt',header=T,sep=';',na.strings = '?')
head(house)
house.n<-subset(house,Date=='1/2/2007'|Date=='2/2/2007')
head(house.n)
house.n$Tempo<-strptime(paste(house.n$Date,house.n$Time,sep=' '),'%d/%m/%Y %H:%M:%S')

#Plot 4
par(mfcol=c(2,2))

plot(house.n$Tempo,house.n$Global_active_power,type='l',xlab='',ylab='Global Active Power')

plot(house.n$Tempo,house.n$Sub_metering_1,type='l',ylab='Energy sub metering',xlab='')
lines(house.n$Tempo,house.n$Sub_metering_2,type='l',col='red')
lines(house.n$Tempo,house.n$Sub_metering_3,type='l',col='blue')
legend('topright',paste("Sub_metering_",1:3,sep=''),lty=1,col=c('black','red','blue'),bty='n',cex=.6)

plot(house.n$Tempo,house.n$Voltage,type='l',xlab='datetime',ylab='Voltage')

plot(house.n$Tempo,house.n$Global_reactive_power,type='l',xlab='datetime',ylab='Global_reactive_power')

dev.copy(png,file='plot4.png')
dev.off()
