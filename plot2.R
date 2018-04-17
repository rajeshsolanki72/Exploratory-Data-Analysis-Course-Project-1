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

## Plot 2
plot(desiredData$Global_active_power ~desiredData$DateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

