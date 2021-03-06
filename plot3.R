##loading data
data<- read.csv("./week1assi/household_power_consumption.txt", sep = ";")

## converting date into date format
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]

for(i in 3:9) data[,i] <- as.numeric(data[,i])
data$DateTime <- strptime(paste(data$Date, data$Time),format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png")
with(data, plot(DateTime,Sub_metering_1, type="l", col= "black" , ylab = "Energy sub metering", xlab = ""))
with(data, lines(DateTime,Sub_metering_2,col = "red"))
with(data, lines(DateTime,Sub_metering_3, col= "blue"))
legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
dev.off()
