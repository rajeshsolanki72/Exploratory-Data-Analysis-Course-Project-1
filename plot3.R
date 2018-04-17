## Reading Data

Dataset <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",
                      colClasses = c("character", "character", rep("numeric",7)),na = "?")
## Formating date
Dataset$Date<-as.Date(Dataset$Date,format = "%d/%m/%Y")

## Subsetting the data
desiredData <- subset(Dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Dataset)

## Converting dates
datetime <- paste(as.Date(desiredData$Date),desiredData$Time)
desiredData$DateTime <- as.POSIXct(datetime)

## Plot 3
with(desiredData, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Enery Sub Metering", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

