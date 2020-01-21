data <- read.table("~/Desktop/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c(Date = "character", Time = "character"))
#Reads in data with date and time as character vectors

data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
#Subsets to the relevant dates

x <- paste(data2$Date,data2$Time)
#Combines the Date and Time character variables into a single character variable 

y <- strptime(x, format = "%d/%m/%Y %H:%M:%S")
#Converts variable x to POSIXlt class y

png(filename = "plot2.png")
#Opens png file device; creates file "plot2.png"

plot(y, data2$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = NA, type = "l")
#Plots the graph axes to png device

dev.off()
#Turns device off