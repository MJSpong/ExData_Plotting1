data <- read.table("~/Desktop/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c(Date = "character", Time = "character"))
#Reads in data with date and time as character vectors

data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
#Subsets to the relevant dates

png(filename = "plot1.png")
#Opens png file device; creates file "plot1.png"

hist(data2$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
#Plots the histogram 

dev.off()
#Turns device off