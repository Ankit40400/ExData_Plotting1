if(!file.exists("./week1assi/household_power_consumption.txt")){
  msg <- "data file not present please download"
 } else{
  data <- paste("Your plot file is saved in ", getwd())
 }

data <- read.csv("./week1assi/household_power_consumption.txt", sep = ";")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]
for(i in 3:9) data[,i] <- as.numeric(data[,i])
data$DateTime <- strptime(paste(data$Date, data$Time),format = "%Y-%m-%d %H:%M:%S")
png(filename = "plot2.png")

with(data,plot(DateTime, Global_active_power, xlab = "",ylab = "Global Active Power (kilowatts)", type = 'l'))

dev.off()

