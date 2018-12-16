datos <- read.delim("household_power_consumption.txt",
                    header = TRUE, sep = ";", dec = ".")
fechas <- as.Date(datos$Date,format = "%d/%m/%Y")
indices <- fechas >= "2007-2-1" & fechas <= "2007-2-2"
data <- datos[indices,]
data1 <- as.numeric(as.character(data$Global_active_power))
a <- paste(as.character(data$Date),as.character(data$Time),sep=" ")
a <- strptime(a,format = "%d/%m/%Y %H:%M:%S")
Subme1 <- as.numeric(as.character(data$Sub_metering_1))
Subme2 <- as.numeric(as.character(data$Sub_metering_2))
Subme3 <- as.numeric(as.character(data$Sub_metering_3))
volt <- as.numeric(as.character(data$Voltage))
global <- as.numeric(as.character(data$Global_reactive_power))
par(mfrow=c(2,2),mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(a,data1, type = "l", xlab = "", 
     ylab = "Global Active Power (Kilowatts)", col = "blue")
plot(a,volt, type = "l", ylab= "Voltage", xlab = "datetime", col = "blue")
plot(a,Subme1, type="l", xlab = "", ylab = "Energy sub metering")
lines(a,Subme2, col = "red")
lines(a,Subme3, col = "blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","blue","red"), lty=1, cex=0.5)
plot(a,global, type = "l", ylab= "Global_reactive_power", 
     xlab = "datetime", col = "blue")


# size 480 x 480
dev.copy(png, file = "plot4.png")
dev.off()