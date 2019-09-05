#########################################
# 1 - Download data to working directory
#########################################

# Download zipfile if it does not exists
filename <- "exdata_data_household_power_consumption.zip"

if (!file.exists(filename)){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", filename, method="curl")
}else{
  print("Zip file already exists.")
}

# Checking if file is unzipped in working directory
if (!file.exists("household_power_consumption.txt")) { 
  unzip(filename) 
} else{
  print("File already exists.")
}

#########################################
# 2 - Read data and transform data
#########################################

household <- read.table("household_power_consumption.txt", sep =";", header = TRUE)
household <- subset(household,household$Date=="1/2/2007" | household$Date =="2/2/2007")
household$DateTime <- strptime(paste(household$Date, household$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#########################################
# 3 - Plotting
#########################################

png("plot3.png", width=480, height=480)
plot(household$DateTime, as.numeric(household$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(household$DateTime, as.numeric(household$Sub_metering_2), type="l", col="red")
lines(household$DateTime, as.numeric(household$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.0, col=c("black", "red", "blue"))
dev.off()