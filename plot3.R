
#source("./plot3.R")

d <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?"))
d$Date <- as.Date(as.character(d$Date),"%d/%m/%Y")
d <- d[d$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")), ]
d$datetime <- strptime(paste(d$Date, d$Time, sep=" "), format="%Y-%m-%d %T")

png(file="plot3.png")
par(mfcol=c(1,1))
plot(d$datetime, d$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(d$datetime, d$Sub_metering_2, type="l", col="red")
lines(d$datetime, d$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1)
dev.off()

print("Done :)")
