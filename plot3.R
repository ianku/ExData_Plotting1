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

#converting dates
datetime <- paste(as.Date(DT.filter$Date), DT.filter$Time)
DT.filter$Datetime <- as.POSIXct(datetime)

#plot
with(DT.filter, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

#legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)

#output to PNG
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()


