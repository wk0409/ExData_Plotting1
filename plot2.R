df <- read.table("household_power_consumption.txt", header=TRUE, sep=";") #Read the file from your working dir

subdf <- df [df$Date == "1/2/2007" | df$Date == "2/2/2007",]  #Subset the data of February

subdf$datetime <- strptime( apply( subdf[ , c("Date","Time") ], 1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S" , tz="EST5EDT")

png(filename = "Plot2.png", width=480, height=480)

with(subdf, plot(datetime,as.numeric(as.character(Global_active_power)), type="l", xlab="datetime", ylab="Global Active Power (KiloWatts)"))

dev.off()