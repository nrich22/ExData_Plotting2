# Nicholas Ricciarelli
# Exploratory Data Analysis
# Course Project 2
# Plot 1

# read data
fileName <- "exdata_data_NEI_data/summarySCC_PM25.rds"
data <- readRDS(fileName)

# create plot
aggTotals <- aggregate(Emissions ~ year, data, sum)
png("plot1.png", width=480, height=480, units="px", bg="white")
barplot((aggTotals$Emissions)/10^6, names.arg=aggTotals$year, xlab="Year", ylab="PM2.5 Emissions (10^6 Tons)", main="Total PM2.5 Emissions From All US Sources")
dev.off()
