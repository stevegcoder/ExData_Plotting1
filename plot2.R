powerDf = read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",
                     colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric",
                                    "numeric", "numeric","numeric"))
powerDf = read.csv("household_power_consumption.txt", sep=";", na.strings="?")
powerDf = powerDf[powerDf$Date=="1/2/2007" | powerDf$Date == "2/2/2007",]
powerDf$DateTime = paste(powerDf$Date,powerDf$Time)
powerDf$DateTime = strptime(powerDf$DateTime, format="%d/%m/%Y %H:%M:%S")

png("plot2.png")
plot(powerDf$DateTime, powerDf$Global_active_power, main = "", type="l", xlab = "",
     ylab = "Global Active Power (kilowatts)", frame.plot = TRUE)
dev.off()