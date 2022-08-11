# Nicholas Ricciarelli
# Exploratory Data Analysis
# Course Project 2
# Plot 4

# read data
fileName1 <- "exdata_data_NEI_data/summarySCC_PM25.rds"
data1 <- readRDS(fileName1)

fileName2 <- "exdata_data_NEI_data/Source_Classification_Code.rds"
data2 <- readRDS(fileName2)

# create plot
combustionRelated <- grepl("comb", data2$data2.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", data2$data2.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionData2 <- data2[coalCombustion,]$data2
combustionData1 <- data1[data1$data2 %in% combustiondata2,]

png("plot4.png",width=480,height=480, units="px", bg="white")
library(ggplot2)
ggp <- ggplot(combustionData1, aes(factor(year), Emissions/10^5)) +
  geom_bar(stat="identity", fill="grey", width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))
print(ggp)
dev.off()
