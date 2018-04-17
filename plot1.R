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

## Plot 1
hist(desiredData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
