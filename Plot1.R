df <- read.table("household_power_consumption.txt", header=TRUE, sep=";") #Read the file from your working dir

subdf <- df [df$Date == "1/2/2007" | df$Date == "2/2/2007",]  #Subset the data of February

png(filename = "Plot1.png", width=480, height=480)

hist(as.numeric(as.character(subdf$Global_active_power)), xlab="Global Active Power (Kilowatts)", main="Global Active Power", col="Red") # Plot the histogram

dev.off()
