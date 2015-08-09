#set working directory
setwd("~/datascience/ExData_Plotting1")

#load library data.table
library(data.table)

#load dataset
DT<-fread("./household_power_consumption.txt", na.strings="?")

#set date as d:m:y
DT$Date <- as.Date(DT$Date, format="%d/%m/%Y")

#subsets the data
DT.filter <- subset(DT, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#remove data table
rm(DT)

#select data 
DT.filter$Global_active_power<-as.numeric(DT.filter$Global_active_power)

#plot
hist(DT.filter$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#output to PNG
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()



