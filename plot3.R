df <- read.table("household_power_consumption.txt", header=TRUE, sep=";") #Read the file from your working dir

subdf <- df [df$Date == "1/2/2007" | df$Date == "2/2/2007",]  #Subset the data of February

subdf$datetime <- strptime( apply( subdf[ , c("Date","Time") ], 1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S" , tz="EST5EDT") #Adding datetime

tp <- as.numeric(as.character(subdf[,7]))
tp1 <- as.numeric(as.character(subdf[,8]))
tp2 <- as.numeric(as.character(subdf[,9]))

subdf$tp3 <- tp+tp1+tp2


png(filename = "Plot3.png", width=480, height=480)


with(subdf, plot(datetime,as.numeric(as.character(tp3)), type="n", main="Plot3", xlab="datetime", ylab="Energy Sub Metering"))
points(subdf$datetime,as.numeric(as.character(subdf$Sub_metering_3)), col="Blue", type="l")
points(subdf$datetime,as.numeric(as.character(subdf$Sub_metering_1)), col="Black", type="l")
points(subdf$datetime,as.numeric(as.character(subdf$Sub_metering_2)), col="Red", type="l")
legend("topright", lty=c(1,1,1) , col= c("Black","Red","Blue") , legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()