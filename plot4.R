powerDf = read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",
                     colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric",
                                    "numeric", "numeric","numeric"))
powerDf = read.csv("household_power_consumption.txt", sep=";", na.strings="?")
powerDf = powerDf[powerDf$Date=="1/2/2007" | powerDf$Date == "2/2/2007",]
powerDf$DateTime = paste(powerDf$Date,powerDf$Time)
powerDf$DateTime = strptime(powerDf$DateTime, format="%d/%m/%Y %H:%M:%S")

png("plot4.png")

# 2x2 Matrix
par(mfrow=c(2,2))

#plot 1 - Global Active Power
plot(powerDf$DateTime, powerDf$Global_active_power, main = "", type="l", xlab = "",
     ylab = "Global Active Power", frame.plot = TRUE)

#plot 2 - Voltage 
plot(powerDf$DateTime, powerDf$Voltage, main = "", type="l", xlab = "datetime",
     ylab = "Voltage", frame.plot = TRUE)
#plot 3 - Sub Metering
plot(powerDf$DateTime, powerDf$Sub_metering_1, main = "", type="n", xlab = "",
     ylab = "Energy sub metering", frame.plot = TRUE)
lines(powerDf$DateTime, powerDf$Sub_metering_1)
lines(powerDf$DateTime, powerDf$Sub_metering_2, col="Red")
lines(powerDf$DateTime, powerDf$Sub_metering_3, col="Blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=1)

#plot 4 - Global Reactive Power
plot(powerDf$DateTime, powerDf$Global_reactive_power, main = "", type="l", xlab = "datetime",
     ylab = "Global_reactive_power", frame.plot = TRUE)
dev.off()