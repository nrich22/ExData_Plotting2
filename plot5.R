# Nicholas Ricciarelli
# Exploratory Data Analysis
# Course Project 2
# Plot 5

# read data
fileName1 <- "exdata_data_NEI_data/summarySCC_PM25.rds"
data1 <- readRDS(fileName1)

fileName2 <- "exdata_data_NEI_data/Source_Classification_Code.rds"
data2 <- readRDS(fileName2)

# create plot
vehicleData <- grepl("vehicle", data2$data2.Level.Two, ignore.case=TRUE)
vehicles2 <- data2[vehicleData,]$data2
vehicles1 <- data1[data1$data2 %in% vehiclesSCC,]
vehicleData <- vehicles1[vehicles1$fips=="24510",]
png("plot5.png", width=480, height=480, units="px", bg="white")
library(ggplot2)
ggp <- ggplot(vehicleData, aes(factor(year), Emissions)) +
  geom_bar(stat="identity", fill="grey", width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(ggp)

dev.off()
