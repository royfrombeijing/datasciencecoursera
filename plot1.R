setwd("D:/Documents/Dropbox/Learning/data science/assignment")
getwd()

hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
hpc_a1 <- subset(hpc, Date %in% c("1/1/2007", "2/1/2007"))
hpc_a1[, 3:9] <- apply(hpc_a1[, 3:9], 2, function(x) as.numeric(as.character(x)))
summary(hpc_a1)

png("plot1.png", width = 480, height = 480)
par(bg = "transparent")
hist(hpc_a1$Global_active_power, freq =TRUE, breaks = 12,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red"
     )
dev.off()

