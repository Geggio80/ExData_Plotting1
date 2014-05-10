## PLOT 3: ENERGY SUB METERING TIMELINE (FOR DIFFERENT CLASSES)
## (for re-run the code, change the work directory with setwd() )

# Clear global environment
rm(list = ls())

#Load library
library(sqldf)

# Read data with sql query and create the data frame
query <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
df <- read.csv.sql("household_power_consumption.txt",query,sep=";")
options(warn=-1)

# Convert "Date" and "Time" and adjust local settings
x = strptime(paste(df[,1],df[,2]),"%d/%m/%Y %H:%M:%S")
t = Sys.setlocale("LC_TIME","English")

# Set file device and plot three timelines (one plot) with annotation
png("plot3.png",width = 480, height = 480,units = "px",bg = "transparent")
plot(x,df[,7],type="l",xlab="",ylab="Energy sub metering")
lines(x,df[,8],type="l",col="red")
lines(x,df[,9],type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
