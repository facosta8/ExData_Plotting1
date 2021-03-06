
# Read the table
datos <- read.table("household_power_consumption.txt", 
                    header=T, sep=";", na.strings=c("?"))

# subset for the specific dates that we want
datos2 <- subset(datos, 
                 (datos$Date=="1/2/2007") | (datos$Date=="2/2/2007"))

# we extract the time and date and consolidate them as a
#single variable
tiempo <- paste(datos2$Date,datos2$Time)
tiempo <- strptime(tiempo, format="%d/%m/%Y %H:%M:%S")

# create a new dataset with that unified Date variable
datos3 <- data.frame(tiempo,datos2[,3:9])

# adjust the language for the days in English
Sys.setlocale(category = "LC_TIME", locale = "C")

# we make the plot
png(filename="plot2.png",  width = 480, height = 480)
plot(datos3$tiempo, datos3$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()