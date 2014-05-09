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


### create and save third PNG plot (with given size)
png(file = "plot3.png", width = 480, height = 480, units='px', bg = "transparent")
plot(hpc$DateTime, hpc$Sub_metering_1, type='l', ylab="Energy sub metering" , xlab="")
lines(hpc$DateTime, hpc$Sub_metering_2, col=2)
lines(hpc$DateTime, hpc$Sub_metering_3, col=4)
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c(1,2,4), lwd = 2)
dev.off()