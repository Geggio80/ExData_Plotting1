## PLOT 1: GLOBAL ACTIVE POWER HISTOGRAM

# Clear global environment
rm(list = ls())

#Load library
library(sqldf)

# Read data with sql query and create the data frame
query <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
df <- read.csv.sql("household_power_consumption.txt",query,sep=";")
options(warn=-1)

# Set file device and plot histogram with annotation
png("plot1.png",bg = "transparent")
hist(df[,3],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
