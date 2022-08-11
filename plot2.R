# Nicholas Ricciarelli
# Exploratory Data Analysis
# Course Project 2
# Plot 2

# read data
fileName <- "exdata_data_NEI_data/summarySCC_PM25.rds"
data <- readRDS(fileName)
data <- data[data$fips=="24510",]

# create plot
aggTotals <- aggregate(Emissions ~ year, data, sum)
png("plot2.png", width=480, height=480, units="px", bg="white")
barplot(aggTotals$Emissions, names.arg=aggTotals$year, xlab="Year", ylab="PM2.5 Emissions (Tons)", main="Total PM2.5 Emissions From all Baltimore City Sources")
dev.off()