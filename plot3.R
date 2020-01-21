data <- read.table("~/Desktop/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c(Date = "character", Time = "character"))
#Reads in data with date and time as character vectors

data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
#Subsets to the relevant dates

x <- paste(data2$Date,data2$Time)
#Combines the Date and Time character variables into a single character variable 

y <- strptime(x, format = "%d/%m/%Y %H:%M:%S")
#Converts variable x to POSIXlt class y

png(filename = "plot3.png")
#Opens png file device; creates file "plot3.png"

plot(y, data2$Sub_metering_1, ylab = "Energy sub metering", xlab = NA, type = "l", col = "black")
#Plots the graph to png device

lines(y, data2$Sub_metering_2, col = "red")

lines(y, data2$Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black","red","blue"))

dev.off()
#Turns device off