data <- read.csv("./week1assi/household_power_consumption.txt", sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-01",]
data$Global_active_power <- as.numeric(data$Global_active_power)

png(filename = "plot1.png")
hist(data$Global_active_power, col = "Red" , xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
dev.off()

