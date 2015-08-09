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

#plot with legends
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(DT.filter, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l",
       ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)
  plot(Global_reactive_power~Datetime, type="l",
       ylab="Global_Rective_Power",xlab="datetime")
})

#output to PNG
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()





