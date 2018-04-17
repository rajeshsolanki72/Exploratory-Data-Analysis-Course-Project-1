## Reading Data

Dataset <- read.table("./household_power_consumption.txt",header = TRUE,sep = ";",
                      colClasses = c("character", "character", rep("numeric",7)),na = "?")
## Formating date
Dataset$Date<-as.Date(Dataset$Date,format = "%d/%m/%Y")

## Subsetting the data
desiredData <- subset(Dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Dataset)

## Converting dates
datetime <- paste(as.Date(desiredData$Date),desiredData$Time)
desiredData$DateTime <- as.POSIXct(datetime)



## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(desiredData, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Enery Sub Metering", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="datetime")
})


## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

