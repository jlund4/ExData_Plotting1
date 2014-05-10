hpc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", 
                  col.names = colnames(read.table(
                  "household_power_consumption.txt",
                   nrow = 1, header = TRUE, sep=";")))

png(file = "plot1.png")

hist(hpc[,3], col = "red", main = "Global Active Power", ylab = "Frequency", 
xlab = "Global Active Power (kilowatts)")
dev.off()