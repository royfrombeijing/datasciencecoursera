setwd("D:/Documents/Dropbox/Learning/data science/assignment")
getwd()

hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
hpc_a1 <- subset(hpc, Date %in% c("1/1/2007", "2/1/2007"))
hpc_a1$DT <- paste(hpc_a1$Date, hpc_a1$Time, " ")
hpc_a1[, 3:9] <- apply(hpc_a1[, 3:9], 2, function(x) as.numeric(as.character(x)))
hpc_a1$DT <- strptime(hpc_a1$DT, format = "%d/%m/%Y %T")
Sys.setlocale("LC_TIME", "English")
hpc_a1$day <- weekdays(hpc_a1$DT, abbreviate = TRUE)
summary(hpc_a1)

png("plot4.png", width = 480, height = 480)
par(bg = "transparent", mfrow = c(2, 2))

plot(x = hpc_a1$DT, y = hpc_a1$Global_active_power, type = "l",
     main = "",
     ylab = "Global Active Power (kilowatts)",
     xlab = ""
)

plot(x = hpc_a1$DT, y = hpc_a1$Voltage, type = "l",
     main = "",
     ylab = "Voltage",
     xlab = "datetime"
)

plot(x = hpc_a1$DT, y = hpc_a1$Sub_metering_3, type = "l", col = "blue",
     main = "",
     ylab = "Energy sub metering",
     xlab = "",
     ylim = c(0, 30)
)
points(x = hpc_a1$DT, y = hpc_a1$Sub_metering_1, type = "l")
points(x = hpc_a1$DT, y = hpc_a1$Sub_metering_2, type = "l", col = "red")
legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(x = hpc_a1$DT, y = hpc_a1$Global_reactive_power, type = "l",
     main = "",
     ylab = "Global_reactive_power",
     xlab = "datetime"
)
dev.off()
