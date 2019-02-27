Sys.setlocale('LC_TIME',"C")

house<-read.table('household_power_consumption.txt',header=T,sep=';',na.strings = '?')
house.n<-subset(house,Date=='1/2/2007'|Date=='2/2/2007')
house.n$Tempo<-strptime(paste(house.n$Date,house.n$Time,sep=' '),'%d/%m/%Y %H:%M:%S')

#Plot 3
plot(house.n$Tempo,house.n$Sub_metering_1,type='l',ylab='Energy sub metering',xlab='')
lines(house.n$Tempo,house.n$Sub_metering_2,type='l',col='red')
lines(house.n$Tempo,house.n$Sub_metering_3,type='l',col='blue')
legend('topright',paste("Sub_metering_",1:3,sep=''),lty=1,col=c('black','red','blue'))

dev.copy(png,file='plot3.png')
dev.off()
