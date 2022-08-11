# Nicholas Ricciarelli
# Exploratory Data Analysis
# Course Project 2
# Plot 3

# read data
fileName <- "exdata_data_NEI_data/summarySCC_PM25.rds"
data <- readRDS(fileName)
data <- data[data$fips=="24510",]

# create plot
png("plot3.png", width=480, height=480, units="px", bg="white")
library(ggplot2)
ggp <- ggplot(data, aes(factor(year), Emissions, fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type, scales = "free", space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))
print(ggp)
dev.off()
