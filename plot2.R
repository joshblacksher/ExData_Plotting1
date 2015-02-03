
#source("./plot2.R")

d <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?"))
d$Date <- as.Date(as.character(d$Date),"%d/%m/%Y")
d <- d[d$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")), ]
d$datetime <- strptime(paste(d$Date, d$Time, sep=" "), format="%Y-%m-%d %T")

png(file="plot2.png")
par(mfcol=c(1,1))
plot(d$datetime, d$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

print("Done :)")
