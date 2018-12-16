datos <- read.delim("household_power_consumption.txt",
                    header = TRUE, sep = ";", dec = ".")
fechas <- as.Date(datos$Date,format = "%d/%m/%Y")
indices <- fechas >= "2007-2-1" & fechas <= "2007-2-2"
data <- datos[indices,]
data1 <- as.numeric(as.character(data$Global_active_power))
hist(data1, col = "blue", xlab = "Global Active Power (Kilowatts)",
     main = "Global Active Power")
# size 480 x 480
dev.copy(png, file = "plot1.png")
dev.off()