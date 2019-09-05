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
# 2 - Read data
#########################################

household <- read.table("household_power_consumption.txt", sep =";", header = TRUE)
household <- subset(household,household$Date=="1/2/2007" | household$Date =="2/2/2007")

#########################################
# 3 - Plotting histogram
#########################################

png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(household$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
