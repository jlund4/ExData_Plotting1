hpc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", 
                  col.names = colnames(read.table(
                  "household_power_consumption.txt",
                   nrow = 1, header = TRUE, sep=";")))

png(file = "plot3.png")

time <- paste(hpc$Date, hpc$Time)
time2 <- strptime(time, "%d/%m/%Y %H:%M:%S")
hpc$time2 <- time2
hpc$day <- weekdays(hpc$time2)
hpc2 <- hpc[,3:11]

plot(hpc2$Sub_metering_1, type = 'l', ylab = "Energy sub metering", xaxt = 'n', xlab = "")
lines(hpc2$Sub_metering_2, type ='l', col="red")
lines(hpc2$Sub_metering_3, type = 'l', col="blue")
axis(1,label="Thur", at = 0)
axis(1,label="Fri", at = 1440)
axis(1,label="Sat", at = 2910)
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"),
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()