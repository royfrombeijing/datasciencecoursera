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

png("plot3.png", width = 480, height = 480)
par(bg = "transparent")
plot(x = hpc_a1$DT, y = hpc_a1$Sub_metering_3, type = "l", col = "blue",
     main = "",
     ylab = "Energy sub metering",
     xlab = "",
     ylim = c(0, 25)
)
points(x = hpc_a1$DT, y = hpc_a1$Sub_metering_1, type = "l")
points(x = hpc_a1$DT, y = hpc_a1$Sub_metering_2, type = "l", col = "red")
legend("topright", lty = 1, col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
