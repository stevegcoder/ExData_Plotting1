powerDf = read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",
                     colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric",
                                    "numeric", "numeric","numeric"))
powerDf = read.csv("household_power_consumption.txt", sep=";", na.strings="?")
powerDf = powerDf[powerDf$Date=="1/2/2007" | powerDf$Date == "2/2/2007",]
powerDf$DateTime = paste(powerDf$Date,powerDf$Time)
powerDf$DateTime = strptime(powerDf$DateTime, format="%d/%m/%Y %H:%M:%S")

png("plot3.png")
plot(powerDf$DateTime, powerDf$Sub_metering_1, main = "", type="n", xlab = "",
     ylab = "Energy sub metering", frame.plot = TRUE)
lines(powerDf$DateTime, powerDf$Sub_metering_1)
lines(powerDf$DateTime, powerDf$Sub_metering_2, col="Red")
lines(powerDf$DateTime, powerDf$Sub_metering_3, col="Blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=1)
dev.off()