## Hana S
## 09/05/2014

## set working directory
setwd('/Users/hanasusak/Desktop/Coursera/EDA/ExData_Plotting1')

## load the data
hpc <- read.table(file='household_power_consumption.txt', sep=';', na.strings = "?", header=T)
## select only two dates of interest
hpc <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"),]

## create DateTime variable, containing info about date and time
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime, format="%Y-%m-%d %H:%M:%S")


### create and save fourth PNG plot (with given size)
png(file = "plot4.png", width = 480, height = 480, units='px', bg = "transparent")
par(mfrow=c(2,2))

plot(hpc$DateTime, hpc$Global_active_power, type='l', ylab="Global Active Power" , xlab="")

plot(hpc$DateTime, hpc$Voltage, type='l' , xlab="datetime", ylab='Voltage')

plot(hpc$DateTime, hpc$Sub_metering_1, type='l', ylab="Energy sub metering" , xlab="")
lines(hpc$DateTime, hpc$Sub_metering_2, col=2)
lines(hpc$DateTime, hpc$Sub_metering_3, col=4)
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c(1,2,4), lwd = 1, box.lwd = 0)

plot(hpc$DateTime, hpc$Global_reactive_power, type='l' ,xlab="datetime", ylab="Global_reactive_power")

dev.off()
