datos <- read.delim("household_power_consumption.txt",
                    header = TRUE, sep = ";", dec = ".")
fechas <- as.Date(datos$Date,format = "%d/%m/%Y")
indices <- fechas >= "2007-2-1" & fechas <= "2007-2-2"
data <- datos[indices,]
data1 <- as.numeric(as.character(data$Global_active_power))
a <- paste(as.character(data$Date),as.character(data$Time),sep=" ")
a <- strptime(a,format = "%d/%m/%Y %H:%M:%S")
plot(a,data1, type = "l", xlab = "",
     ylab = "Global Active Power (Kilowatts)", col = "blue")
# size 480 x 480
dev.copy(png, file = "plot2.png")
dev.off()