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


### create and save second PNG plot (with given size)
png(file = "plot2.png", width = 480, height = 480, units='px', bg = "transparent")
plot(hpc$DateTime, hpc$Global_active_power, type='l', ylab="Global Active Power (kilowatts)" , xlab="")
dev.off()
