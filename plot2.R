# 2.	Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510"\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? 
## reading in datas
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
maryland_pm <- NEI %>% select(fips,Emissions, year) %>% filter(fips == "24510")
boxplot(log(Emissions)~year, data = maryland_pm, main="maryland_pm")
dev.copy(png, file= "plot2.png")
dev.off()

