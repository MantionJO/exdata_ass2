# 3.Of the four types of sources indicated by the type (point, nonpoint, 
# onroad, nonroad) variable, which of these four sources have seen decreases 
# in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? 
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
maryland_pm <- NEI %>% filter(fips == "24510")
bal <- maryland_pm %>% group_by(Emissions, year, type) %>% summarize(PM = mean(Emissions, na.rm = T))
qplot(year, PM, data = bal, color= factor(bal$type), geom = c("point", "line"),
      main = "PM Emissions in Baltimore city")
dev.copy(png, file= "plot3.png")
dev.off()
