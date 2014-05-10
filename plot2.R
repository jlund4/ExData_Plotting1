hpc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", 
                  col.names = colnames(read.table(
                  "household_power_consumption.txt",
                   nrow = 1, header = TRUE, sep=";")))

png(file = "plot2.png")

time <- paste(hpc$Date, hpc$Time)
time2 <- strptime(time, "%d/%m/%Y %H:%M:%S")
hpc$time2 <- time2
hpc$day <- weekdays(hpc$time2)
hpc2 <- hpc[,3:11]

plot(hpc2[,1], ylab = "Global Active Power (kilowatts)", type = "l", xaxt='n')
axis(1,label="Thur", at = 0)
axis(1,label="Fri", at = 1440)
axis(1,label="Sat", at = 2910)
dev.off()