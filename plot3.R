datos <- read.delim("household_power_consumption.txt",
                    header = TRUE, sep = ";", dec = ".")
fechas <- as.Date(datos$Date,format = "%d/%m/%Y")
indices <- fechas >= "2007-2-1" & fechas <= "2007-2-2"
data <- datos[indices,]
a <- paste(as.character(data$Date),as.character(data$Time),sep=" ")
a <- strptime(a,format = "%d/%m/%Y %H:%M:%S")
Subme1 <- as.numeric(as.character(data$Sub_metering_1))
Subme2 <- as.numeric(as.character(data$Sub_metering_2))
Subme3 <- as.numeric(as.character(data$Sub_metering_3))
plot(a,Subme1, type="l", xlab = "", ylab = "Energy sub metering")
lines(a,Subme2, col = "red")
lines(a,Subme3, col = "blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","blue","red"), lty=1)

# size 480 x 480
dev.copy(png, file = "plot3.png")
dev.off()